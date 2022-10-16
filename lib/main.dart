import 'package:flutter/material.dart';
import 'package:flutter_practical_task/core/intial_binding.dart';
import 'package:flutter_practical_task/ui/home_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
     initialBinding: InitialBinding(),
     home: const HomeScreen(),
    );
  }
}




