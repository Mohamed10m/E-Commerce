import 'package:e_commerce/core/view_model/shipping_address_view_model.dart';
import 'package:e_commerce/shared/constants/constants.dart';
import 'package:e_commerce/shared/style/dimensions.dart';
import 'package:e_commerce/view/shipping_adress/shinning_adress_view.dart';
import 'package:e_commerce/view/widgets/custom_add_address.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShippingAddressViewModel>(
      init: ShippingAddressViewModel(),
      builder: (controller) => Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: padding(context),
            child: Column(
              children: [
                CustomAddAddress(
                    controller: controller.nameController, text: 'Full Name'),
                hSizedBox2,
                CustomAddAddress(
                    controller: controller.addressController, text: 'Address'),
                hSizedBox2,
                CustomAddAddress(
                    controller: controller.cityController, text: 'City'),
                hSizedBox2,
                CustomAddAddress(
                    controller: controller.streetController, text: 'Street'),
                hSizedBox2,
                CustomAddAddress(
                    controller: controller.countryController, text: 'Country'),
                hSizedBox3,
                CustomButton(
                  height: 50,
                  text: 'Add',
                  width: MediaQuery.of(context).size.width,
                  onPressed: (){
                    controller.addAddressToFirebase();
                    Get.to(ShippingAddressView());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}