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


void main1() {

  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }
}



// Write Code snippet:-
// Array :- [1,2,3,4,5,6,7]
// Task:- Take 3 variables named
// a) White flag
// b) Red Flag 1.
// c) Red Flag 2.
// Assign their index value from the array randomly.
// Write a code to find out which Red Flag is closer to White Flag.
// Return value or index of Nearest Red Flag.
