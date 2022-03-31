import 'package:e_commerce/core/view_model/profile_view_model.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/shared/constants/constants.dart';
import 'package:e_commerce/shared/style/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'custom_text.dart';

class BuildItemUser extends StatelessWidget {
  BuildItemUser({Key? key, required this.index, required this.userModel})
      : super(key: key);

  final UserModel userModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        index == 5
            ? Get.find<ProfileViewModel>().sinOut()
            : Get.to(() => userPages[index]);
      },
      child: Row(
        children: [
          Image.asset(images[index]),
          wSizedBox2,
          CustomText(
            text: text[index],
            fontSize: 18,
            fontFamily: 'DisplayRegular',
          ),
          const Spacer(),
          const Icon(Icons.navigate_next),
        ],
      ),
    );
  }
}