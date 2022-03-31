import 'package:flutter/material.dart';

class DeliveryTime extends StatelessWidget {
  const DeliveryTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: const Text(
              "Choose delivery time",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}