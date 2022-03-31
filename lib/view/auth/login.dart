import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/shared/constants/constants.dart';
import 'package:e_commerce/shared/style/dimensions.dart';
import 'package:e_commerce/view/auth/register.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_button_social.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final _formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Welcome,',
                              fontSize: 30.0,
                              color: Colors.black,
                            ),
                            InkWell(
                              onTap: () => Get.offAll(RegisterScreen()),
                              child: CustomText(
                                text: 'Sign Up',
                                fontSize: 20.0,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                        hSizedBox1,
                        CustomText(
                          text: 'Sign in to Continue',
                          fontSize: 15,
                          color: Colors.grey,
                          alignment: Alignment.topLeft,
                        ),
                        hSizedBox4,
                        CustomTextFormField(
                          hint: 'dkshfri976@gmail.com',
                          text: 'Email',
                          onSaved: (value) {},
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Must write the Email';
                            }
                            return null;
                          },
                          type: TextInputType.emailAddress,
                          controller: controller.email,
                        ),
                        hSizedBox1,
                        CustomTextFormField(
                          hint: '**********',
                          text: 'Password',
                          onSaved: (value) {},
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Must write the Password';
                            }
                            return null;
                          },
                          type: TextInputType.visiblePassword,
                          controller: controller.password,
                        ),
                        hSizedBox2,
                        CustomText(
                          text: 'Forgot Password?',
                          fontFamily: 'DisplayRegular',
                          fontSize: 15,
                          alignment: Alignment.topRight,
                        ),
                        hSizedBox3,
                        CustomButton(
                          width: double.infinity,
                          text: 'SIGN IN',
                          height: 50.0,
                          onPressed: () {
                            if(_formKey.currentState!.validate())
                            {
                              controller.sinInWithEmailAndPassword();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                hSizedBox3,
                CustomText(
                  text: '-OR-',
                  fontSize: 25.0,
                  color: Colors.black,
                ),
                hSizedBox3,
                ButtonSocial(
                  onPressed: () {
                    controller.googleSignIn();
                  },
                  text: 'Sign In with Google',
                  textImage: 'images/google.png',
                ),
                hSizedBox2,
                ButtonSocial(
                  onPressed: () {
                    controller.facebookLogin();
                  },
                  text: 'Sign In with Facebook',
                  textImage: 'images/facebook.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}