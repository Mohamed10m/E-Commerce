import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/auth/login.dart';
import 'package:e_commerce/view/home_layout/home_layout_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends StatelessWidget {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null)
          ? HomeView()
          : LoginScreen();
    });
  }
}
