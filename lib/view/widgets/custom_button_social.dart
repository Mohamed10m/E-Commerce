import 'package:e_commerce/shared/style/dimensions.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ButtonSocial extends StatelessWidget {

  final String textImage;
  final String text;
  final onPressed;

  const ButtonSocial({Key? key, required this.textImage, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.0,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Row(
          children: [
            wSizedBox2,
            Image.asset(textImage),
            wSizedBox4,
            CustomText(
              color: Colors.black,
              text: text,
              fontSize: 20.0,
              fontFamily: 'DisplayRegular',
            ),
          ],
        ),
      ),
    );
  }
}