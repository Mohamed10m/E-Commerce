import 'package:flutter/material.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: const Text(
              "Add your Address",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}