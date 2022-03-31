import 'package:e_commerce/core/view_model/checkout_view_model.dart';
import 'package:e_commerce/shared/constants/constants.dart';
import 'package:e_commerce/shared/style/dimensions.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardForm extends StatelessWidget {
  CardForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: CheckOutViewModel(),
      builder: (controller) => Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.asset(
                '$urlImage/card.png',
                fit: BoxFit.fill,
              ),
              Positioned(
                left: 50,
                top: 219,
                child: Row(
                  children: [
                    Text(
                      controller.cardNumber,
                      style: const TextStyle(
                          fontSize: 21,
                          fontFamily: 'DisplayRegularBold',
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 50,
                top: 270,
                child: Row(
                  children: [
                    CustomText(
                      text: controller.cardName,
                      fontSize: 21,
                      color: Colors.white,
                      fontFamily: 'DisplayRegularBold',
                    ),
                    wSizedBox4,
                    CustomText(
                      text: controller.cardCvv,
                      fontSize: 21,
                      color: Colors.white,
                      fontFamily: 'DisplayRegularBold',
                    )
                  ],
                ),
              ),
            ],
          ),
          TextFormField(
            controller: controller.nameCard,
            onChanged: (name) {
              controller.nameFun(name);
            },
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          TextFormField(
            inputFormatters: [controller.maskFormatterNumber],
            controller: controller.number,
            decoration: const InputDecoration(
              labelText: 'Card number',
            ),
            onChanged: (number) {
              controller.numberCardFun(number);
            },
          ),
          TextFormField(
            inputFormatters: [controller.maskFormatterCvv],
            controller: controller.cvvCard,
            onChanged: (number) {
              controller.cardCvvFun(number);
            },
            decoration: const InputDecoration(
              labelText: 'CVV',
            ),
          ),
        ],
      ),
    );
  }
}