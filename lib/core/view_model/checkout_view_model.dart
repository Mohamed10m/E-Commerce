import 'package:e_commerce/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class CheckOutViewModel extends GetxController {


  String cardNumber = '';
  String cardCvv = '';
  String cardName = '';
  int currentStep = 0;


  TextEditingController number = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController nameCard = TextEditingController();
  TextEditingController cvvCard = TextEditingController();

  var maskFormatterNumber = MaskTextInputFormatter(mask: '####    ####    ####    ####');
  var maskFormatterCvv = MaskTextInputFormatter(mask: '##/##');

  void numberCardFun(String num){
    cardNumber = num;
    update();
  }
  void nameFun(String name){
    cardName = name;
    update();
  }
  void cardCvvFun(String num){
    cardCvv = num;
    update();
  }




  void onStepCancel() {
    if (currentStep > 0) {
      currentStep -= 1;
    } else {
      currentStep = 0;
    }
    update();
  }
  void onStepContinue() {
    if (currentStep < steps.length - 1) {
      currentStep += 1;
    } else {
      currentStep = 0;
    }
    update();
  }
  void onStepTapped(int step) {
    currentStep = step;
    update();
  }
}