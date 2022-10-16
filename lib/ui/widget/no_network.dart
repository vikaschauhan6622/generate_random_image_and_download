import 'package:flutter/material.dart';

class NoNetworkWidget extends StatelessWidget {
  const NoNetworkWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.wifi_off,
            size: 40,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Device network connection lost',
          ),
          Text(
            'Please check your internet connection',
          ),
        ],
      ),
    );
  }
}
