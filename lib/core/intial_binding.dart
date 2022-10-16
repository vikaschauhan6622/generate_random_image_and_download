import 'package:flutter_practical_task/core/home_controller.dart';
import 'package:get/get.dart';


class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}