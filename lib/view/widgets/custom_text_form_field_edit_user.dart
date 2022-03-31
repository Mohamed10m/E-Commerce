import 'package:flutter/material.dart';

class CustomTextFormFieldEditUser extends StatelessWidget {

  final onSaved;
  final FormFieldValidator? validator;
  final String hint;
  final TextInputType type;
  final TextEditingController controller;

  const CustomTextFormFieldEditUser({
    Key? key,
    this.onSaved,
    required this.hint,
    required this.type,
    this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: controller,
        onSaved: onSaved,
        keyboardType: type,
        validator: validator,
        // textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 20, fontFamily: 'DisplayRegularMedium'),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20.0),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}