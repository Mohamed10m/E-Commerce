import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/service/firebase_adress.dart';
import 'package:e_commerce/core/view_model/shipping_address_view_model.dart';
import 'package:e_commerce/model/shipping_address_model.dart';
import 'package:e_commerce/shared/constants/constants.dart';
import 'package:e_commerce/shared/style/dimensions.dart';
import 'package:e_commerce/view/shipping_adress/add_address_view.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingAddressView extends GetWidget<ShippingAddressViewModel> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShippingAddressViewModel>(
      init: ShippingAddressViewModel(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: padding(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseAddress().getAddress(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) return const Text('Loading...');
                        return SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height,
                            child: ListView.separated(
                                itemBuilder: (context, index) => builderItems(context, controller, snapshot.data!.docs[index], index),
                                separatorBuilder: (context, index)=> hSizedBox2,
                                itemCount: snapshot.data!.docs.length)
                        );
                      })
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => const AddAddressView());
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  Widget builderItems(BuildContext context, ShippingAddressViewModel controller,
      DocumentSnapshot<Object?> document, int index) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: padding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText(
                  text: document['name'],
                  fontSize: 20,
                  fontFamily: 'DisplayRegularMedium',
                ),
                const Spacer(),
                CustomText(
                  text: 'Edit',
                  fontSize: 20,
                  color: primaryColor,
                  fontFamily: 'DisplayRegularMedium',
                ),
              ],
            ),
            hSizedBox2,
            CustomText(
                text:
                '${document['city']} ${document['street']} ${document['zip']}',
                fontSize: 25,
                fontFamily: 'DisplayRegular'), // street
            hSizedBox2,
            CustomText(
                text: '${document['country']} ',
                fontSize: 25,
                fontFamily: 'DisplayRegular'),
            hSizedBox2,
            Row(
              children: [
                SizedBox(
                  width: 20,
                  child: Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: document['isCheck'],
                    onChanged: (bool? value) {
                      AddressModel model = AddressModel(
                        zip: document['zip'],
                        country: document['country'],
                        city: document['city'],
                        address: document['address'],
                        name: document['name'],
                        id: document['id'],
                        isCheck: value,
                        street: document['street'],
                      );
                      controller.updateCheckBoxing(
                          controller.idAddress[index], model);
                    },
                  ),
                ),
                wSizedBox2,
                CustomText(
                  text: 'Use as the shipping address',
                  fontSize: 25,
                  color: Colors.grey.shade800,
                  fontFamily: 'DisplayRegular',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}