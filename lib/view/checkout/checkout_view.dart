import 'package:e_commerce/core/view_model/checkout_view_model.dart';
import 'package:e_commerce/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: CheckOutViewModel(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text('Checkout'),
        ),
        body: Stepper(
          steps: steps,
          type: StepperType.horizontal,
          onStepTapped: (step) => controller.onStepTapped(step),
          onStepContinue: () {
            controller.onStepContinue();
          },
          onStepCancel: () => controller.onStepCancel(),
          currentStep: controller.currentStep,
        ),
      ),
    );
  }
}