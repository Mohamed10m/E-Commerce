import 'package:flutter/material.dart';

class CustomAddAddress extends StatelessWidget {


  CustomAddAddress({required this.controller,required this.text});
  final String text;
  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
          hintText: text,
          hintStyle: const TextStyle(color: Colors.black54),
        ),
      ),
    );
  }
}