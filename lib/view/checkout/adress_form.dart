import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/core/service/firebase_adress.dart';

import 'package:e_commerce/core/view_model/profile_view_model.dart';
import 'package:e_commerce/shared/constants/constants.dart';
import 'package:e_commerce/shared/style/dimensions.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AddressForm extends StatelessWidget {
  const AddressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      child: GetBuilder<ProfileViewModel>(
          init: ProfileViewModel(),
          builder: (controller) {
            return ConditionalBuilder(
              condition: controller.isProfileLoading,
              builder: (context) => StreamBuilder<QuerySnapshot>(
                  stream: FirebaseAddress().getAddress(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) return const Text('Loading...');
                    return SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                        child: ListView.separated(
                            itemBuilder: (context, index) => builderItems(
                                context, snapshot.data!.docs[index], index),
                            separatorBuilder: (context, index) => hSizedBox2,
                            itemCount: snapshot.data!.docs.length));
                  }),
              fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
            );
          }),
    );
  }

  Widget builderItems(
      BuildContext context, DocumentSnapshot<Object?> document, int index) {
    return document['isCheck'] == true
        ? Card(
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

                ),
                const Spacer(),
                CustomText(
                  text: 'Edit',
                  fontSize: 20,
                  color: primaryColor,

                ),
              ],
            ),
            hSizedBox2,
            CustomText(
                text:
                '${document['city']} ${document['street']} ${document['zip']}',
                fontSize: 25,
               ), // street
            hSizedBox2,
            CustomText(
                text: '${document['country']} ',
                fontSize: 25,
                ),
          ],
        ),
      ),
    )
        : hSizedBox1;
  }
}