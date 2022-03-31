import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/core/view_model/controll_view_model.dart';
import 'package:e_commerce/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetWidget<AuthViewModel> {


  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        body: GetBuilder<ControlViewModel>(init: ControlViewModel(), builder: (controller) => controller.nextPage[controller.currentIndex],),
        bottomNavigationBar: bottomNavigationBar(context)
    );
  }

  Widget bottomNavigationBar(context) => GetBuilder<ControlViewModel>(
    builder: (controller) => BottomNavigationBar(
      currentIndex: controller.currentIndex,
      onTap: (index) {
        controller.changePage(index: index);
      },
      items: [
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: padding(context),
            child: Column(
              children: [
                Text('Explore',style: Theme.of(context).textTheme.bodyText1,),
                const SizedBox(height: 7,),
                Image.asset('$urlImage/Icon_Explore.png', fit: BoxFit.cover,)
              ],
            ),
          ),
          label: '',
          icon: Image.asset('$urlImage/Icon_Explore.png', fit: BoxFit.cover,),
        ),
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: padding(context),
            child: Column(
              children: [
                Text('Cart',style: Theme.of(context).textTheme.bodyText1,),
                const SizedBox(height: 7,),
                Image.asset('$urlImage/Icon_Cart.png', fit: BoxFit.cover,)
              ],
            ),
          ),
          icon: Image.asset('$urlImage/Icon_Cart.png', fit: BoxFit.cover,),
          label: '',
        ),
        BottomNavigationBarItem(

          activeIcon: Padding(
            padding: padding(context),
            child: Column(
              children: [
                Text('Account',style: Theme.of(context).textTheme.bodyText1,),
                const SizedBox(height: 7,),
                Image.asset('$urlImage/Icon_User.png', fit: BoxFit.cover,)
              ],
            ),
          ),
          icon: Image.asset('$urlImage/Icon_User.png', fit: BoxFit.cover,),
          label: '',
        ),
      ],
    ),
  );
}