import 'package:e_commerce/core/view_model/edit_profile_view_model.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/shared/constants/constants.dart';
import 'package:e_commerce/shared/style/dimensions.dart';
import 'package:e_commerce/shared/style/icon_broken.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/custom_text_form_field_edit_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({Key? key, required this.userModel}) : super(key: key);

 final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Text(''),
        ),
        body: GetBuilder<EditProfileViewModel>(
          init: EditProfileViewModel(),
          builder: (controller) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 50, right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(IconBroken.Arrow___Left_2),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () => controller.changeFinished(userModel: userModel, context: context),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: primaryColor,
                            ),
                            height: 40.0,
                            width: 40.0,
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    hSizedBox3,
                    CustomText(
                      text: 'Account',
                      fontSize: 35,
                    ),
                    hSizedBox4,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Photo',
                          fontSize: 25,
                          color: Colors.grey,
                        ),
                        wSizedBox4,
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 50.0,
                              backgroundImage: controller.profileImage == null
                                  ? NetworkImage('${userModel.image}')
                                  : FileImage(controller.profileImage!)
                              as ImageProvider,
                            ),
                            hSizedBox2,
                            InkWell(
                              onTap: () {
                                controller.selectOption(context);
                              },
                              child: CustomText(
                                text: 'Upload Image',
                                fontSize: 25.0,
                                color: primaryColor,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    hSizedBox3,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'Name',
                          fontSize: 20.0,
                          color: Colors.grey,
                        ),
                        wSizedBox4,
                        CustomTextFormFieldEditUser(
                            hint: '${userModel.name}',
                            type: TextInputType.name,
                            controller: controller.nameController),
                      ],
                    ),
                    hSizedBox3,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'Gender',
                          fontSize: 20.0,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 70.0,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.changeGender();
                                controller.type(chooseType.female);
                              },
                              child: CircleAvatar(
                                backgroundColor: controller.isGender
                                    ? Colors.grey
                                    : controller.isColor,
                                radius: 30.0,
                                child: Image.asset(
                                  '$urlImage/male.png',
                                  fit: BoxFit.cover,
                                  height: 25,
                                ),
                              ),
                            ),
                            wSizedBox2,
                            InkWell(
                              onTap: () {
                                controller.changeGender();
                                controller.type(chooseType.male);
                              },
                              child: CircleAvatar(
                                backgroundColor: controller.isGender
                                    ? controller.isColor
                                    : Colors.grey,
                                radius: 30.0,
                                child: Image.asset('$urlImage/female.png',
                                    fit: BoxFit.cover, height: 25),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    hSizedBox3,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'Age',
                          fontSize: 20.0,
                          color: Colors.grey,
                        ),
                        wSizedBox4,
                        CustomTextFormFieldEditUser(
                            hint: '${userModel.age}',
                            type: TextInputType.name,
                            controller: controller.ageController),
                      ],
                    ),
                    hSizedBox3,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'Email',
                          fontSize: 20.0,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 70.0,
                        ),
                        CustomTextFormFieldEditUser(
                            hint: '${userModel.email}',
                            type: TextInputType.name,
                            controller: controller.emailController),
                      ],
                    ),
                  ],
                ),
              )),
        ));
  }
}