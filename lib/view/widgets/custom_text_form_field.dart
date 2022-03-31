import 'package:e_commerce/shared/style/dimensions.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final onSaved;
  final FormFieldValidator? validator;
  final String text;
  final String hint;
  final TextInputType type;
  final TextEditingController controller;

  const CustomTextFormField({
    Key? key,
    this.onSaved,
    required this.text,
    required this.hint,
    required this.type,
    this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          fontSize: 15,
          alignment: Alignment.topLeft,
          color: Colors.grey[600],
          fontFamily: 'DisplayRegular',
        ),
        hSizedBox1,
        TextFormField(
          controller: controller,
          onSaved: onSaved,
          keyboardType: type,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}