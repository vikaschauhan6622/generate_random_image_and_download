import 'dart:math';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  static Random random = Random();
  int value = 1;

  increment() => value++;

  decrement() => value--;

  List<Object> get props => [value];

  String randomPictureUrl(int value) {
    final randInt = random.nextInt(value);
    return 'http://picsum.photos/seed/$randInt/300/300';
  }
}


