import 'package:e_commerce/view/cart/cart_view.dart';
import 'package:e_commerce/view/feeds/feeds_view.dart';
import 'package:e_commerce/view/profile/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int currentIndex = 0;
  List<Widget> nextPage = [
    FeedsView(),
    CartView(),
    ProfileView()
  ];

  void changePage({required int index}){
    currentIndex = index;
    update();
  }
}