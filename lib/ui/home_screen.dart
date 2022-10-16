import 'dart:async';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practical_task/core/connection.dart';
import 'package:flutter_practical_task/core/home_controller.dart';
import 'package:flutter_practical_task/ui/widget/no_network.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeCtr = Get.put(HomeController());
  SharedPreferences? storeImage;
  final ConnectionStatusController connectionController = Get.put(ConnectionStatusController());

  Future<void> _download() async {
    final response = await http
        .get(Uri.parse('http://picsum.photos/seed/${homeCtr.value}/300/300'));
    final imageName =
        path.basename('http://picsum.photos/seed/${homeCtr.value}/300/300');
    final appDir = await path_provider.getApplicationDocumentsDirectory();
    final localPath = path.join(appDir.path, imageName);
    final imageFile = File(localPath);
    Get.snackbar(
      "Image Downloaded",
      localPath,
      icon: const Icon(Icons.image, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
    );
    print("localPath <<<>>>  $localPath");
    await imageFile.writeAsBytes(response.bodyBytes);
    setState(() {});
  }

  void initial() async {
    storeImage = await SharedPreferences.getInstance();
    homeCtr.value = storeImage!.getInt('image')!;
  }

  @override
  void initState() {
    super.initState();
    initial();
  }

  clearValues() async {
    storeImage = await SharedPreferences.getInstance();
    storeImage!.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Obx(() {
          if (connectionController.deviceConnectionStatus.value ==
              connectionController.offline) {
            return const NoNetworkWidget();
          } else {
            return SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: homeCtr.randomPictureUrl(homeCtr.value),
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.width * 0.40,
                      placeholder: (context, url) => const Icon(Icons.people),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.image),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            _download();
                          },
                          child: const Text('Download Image')),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              clearValues();
                              homeCtr.increment();
                              storeImage!.setInt("image", homeCtr.value);
                            });
                          },
                          child: const Text("Next"))
                    ],
                  ),
                ],
              ),
            );
          }
        }));
  }
}
