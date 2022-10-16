import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectionStatusController extends GetxController {
  final RxBool isConnectedToNetwork = false.obs;
  final RxString deviceConnectionStatus = 'checking'.obs;
  final String wifi = 'wifi';
  final String mobile = 'Mobile';
  final String ethernet = 'Ethernet';
  final String offline = 'Offline';
  final String error = 'Error';
  final Rx<ConnectivityResult> connectionStatus = ConnectivityResult.none.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    connectionStatus.value = result;
    if (result == ConnectivityResult.wifi) {
      isConnectedToNetwork.value = false;
      deviceConnectionStatus.value = wifi;
      Get.snackbar(
        deviceConnectionStatus.value,
        "",
        icon: const Icon(Icons.wifi, color: Colors.white),
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );

      debugPrint("DeviceConnectionStatus <<>> ${deviceConnectionStatus.value}");
    } else if (result == ConnectivityResult.mobile) {
      isConnectedToNetwork.value = false;
      deviceConnectionStatus.value = mobile;
      Get.snackbar(
        deviceConnectionStatus.value,
        "",
        icon: const Icon(Icons.signal_cellular_connected_no_internet_4_bar,
            color: Colors.white),
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );

      debugPrint("DeviceConnectionStatus <<>> ${deviceConnectionStatus.value}");
    } else if (result == ConnectivityResult.ethernet) {
      isConnectedToNetwork.value = false;
      deviceConnectionStatus.value = ethernet;
      debugPrint("DeviceConnectionStatus <<>> ${deviceConnectionStatus.value}");
    } else if (result == ConnectivityResult.none) {
      isConnectedToNetwork.value = true;
      deviceConnectionStatus.value = offline;
      Get.snackbar(
        deviceConnectionStatus.value,
        "",
        icon: const Icon(Icons.wifi_off, color: Colors.white),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      debugPrint("DeviceConnectionStatus <<>> ${deviceConnectionStatus.value}");
    } else {
      isConnectedToNetwork.value = true;
      deviceConnectionStatus.value = error;
      debugPrint("DeviceConnectionStatus <<>> ${deviceConnectionStatus.value}");
    }
  }
}
