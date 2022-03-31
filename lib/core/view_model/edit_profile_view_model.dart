import 'dart:io' as i;
import 'package:e_commerce/core/service/firestore_user.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/shared/constants/constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileViewModel extends GetxController {

  // EditProfileViewModel(){firestoreUsers.g();firestoreUsers.getUpdateUser();}

  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var emailController = TextEditingController();
  var genderController = TextEditingController();

  bool _isGender = false;

  bool get isGender => _isGender;

  Color? get isColor => _isColor;
  Color? _isColor = Colors.deepPurple;

  FirestoreUsers firestoreUsers = FirestoreUsers();

  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }


  changeGender() {
    _isGender = !_isGender;
    _isColor = Colors.deepPurple;
    print(_isGender);
    update();
  }

  i.File? profileImage;
  final ImagePicker profileImagePicker = ImagePicker();

  void _makePhoto(ImageSource imageSource) async {
    final pickedFile = await profileImagePicker.pickImage(source: imageSource);
    if (pickedFile != null) {
      profileImage = i.File(pickedFile.path);
    } else {
      print('<<<<<<<<<<<<<<<<<<<<<<<<Error in image>>>>>>>>>>>>>>>');
    }
    update();
    // _updateDatabase(photo);
  }

  void selectOption(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: const Text('Choose from gallery'),
            onPressed: () {
              _makePhoto(ImageSource.gallery);
              Navigator.of(context).pop();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Take a photo'),
            onPressed: () {
              _makePhoto(ImageSource.camera);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  updateUser({
    required String uId,
    required String image,
    required String name,
    required String email,
    required String age,
    required String gender,
  }) async {
    UserModel userModel = UserModel(
        image: image,
        name: name,
        email: email,
        uId: uId,
        age: age,
        gender: gender);
    await firestoreUsers.updateCurrentUser(uId, userModel);
    update();
  }

  void uploadImageUser({
    required String uId,
    required String name,
    required String email,
    required String age,
    required String gender,
  }) async {
    await firestoreUsers
        .uploadImageUserFirebase(profileImage!.path, profileImage!)
        .then(
          (value) {
        value!.ref.getDownloadURL().then((value) {
          updateUser(
              image: value,
              name: name,
              email: email,
              uId: uId,
              age: age,
              gender: gender);
        });
      },
    ).catchError(
          (error) {
        print('<<<<<<$error>>>>>>>>>>>');
      },
    );
    update();
  }

  type(chooseType e) {
    switch (e) {
      case chooseType.male:
        genderController.text = 'male';
        break;
      case chooseType.female:
        genderController.text = 'female';
        break;
    }
    return genderController.text;
  }

  changeFinished({
    required UserModel userModel,
    required BuildContext context
  }) {
    profileImage == null
        ? updateUser(
      uId: userModel.uId!,
      name: (nameController.text.isEmpty
          ? userModel.name
          : nameController.text)!,
      email: (emailController.text.isEmpty
          ? userModel.email
          : emailController.text)!,
      age: (ageController.text.isEmpty
          ? userModel.age
          : ageController.text)!,
      gender: (genderController.text.isEmpty
          ? userModel.gender
          : genderController.text)!,
      image: userModel.image!,
    )
        : uploadImageUser(
      uId: userModel.uId!,
      name: (nameController.text.isEmpty
          ? userModel.name
          : nameController.text)!,
      email: (emailController.text.isEmpty
          ? userModel.email
          : emailController.text)!,
      age: (ageController.text.isEmpty
          ? userModel.age
          : ageController.text)!,
      gender: (genderController.text.isEmpty
          ? userModel.gender
          : genderController.text)!,
    );
    Get.back();
  }
}