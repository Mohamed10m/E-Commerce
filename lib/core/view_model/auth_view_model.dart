import 'package:e_commerce/core/service/firestore_user.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/shared/helper/local_storage_data.dart';
import 'package:e_commerce/view/control/controll_view.dart';
import 'package:e_commerce/view/home_layout/home_layout_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebookSignIn = FacebookLogin();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

  final Rxn<User> _user = Rxn<User>();
  final Rxn<User> _userId = Rxn<User>();

  String? get user => _user.value?.email;
  String? get userId => _user.value?.uid;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    _userId.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignIn() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    print(googleSignInAccount);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    _auth.signInWithCredential(credential).then((value) {
      print(value.user);
      saveUser(value);
      Get.to(ControlView());
    });
  }

  void facebookLogin() async {
    // Log in
    final res = await _facebookSignIn.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

    // Check result status
    switch (res.status) {
      case FacebookLoginStatus.success:
        final FacebookAccessToken? accessToken = res.accessToken;
        final AuthCredential authCredential =
            FacebookAuthProvider.credential(accessToken!.token);
        final result = await FirebaseAuth.instance
            .signInWithCredential(authCredential)
            .then(
          (value) {
            saveUser(value);

            Get.to(ControlView());
          },
        );
        // Get profile data from facebook for use in the app
        final profile = await _facebookSignIn.getUserProfile();
        print('Hello, ${profile!.name}! You ID: ${profile.userId}');
        // Get user profile image url
        final imageUrl = await _facebookSignIn.getProfileImageUrl(width: 100);
        print('Your profile image: $imageUrl');
        // fetch user email
        final email = await _facebookSignIn.getUserEmail();
        // But user can decline permission
        if (email != null) print('And your email is $email');
        break;
      case FacebookLoginStatus.cancel:
        break;
      case FacebookLoginStatus.error:
        print('Error while log in: ${res.error}');
        break;
    }
  }

  void sinInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      )
          .then(
        (value) async {
          await FirestoreUsers().getCurrentUser(value.user!.uid).then((value) {
            setData(UserModel.fromJson(value.data() as Map<String, dynamic>));
          });
          saveUser(value);
          Get.to(const ControlView());
        },
      );
    } catch (e) {
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createUserWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      )
          .then((value) {
        saveUser(value);
      }).catchError(
        (error) {},
      );
      Get.offAll(HomeView());
    } catch (e) {
      Get.snackbar(
        'Error SignUp account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential userCredential) async {
    UserModel userModel = UserModel(
      name: name.text == "" ? userCredential.user!.displayName : name.text,
      email: email.text == "" ? userCredential.user!.email : email.text,
      uId: userCredential.user!.uid,
      image:
          'https://firebasestorage.googleapis.com/v0/b/e-commerce-b50f8.appspot.com/o/user%2Fperson.png?alt=media&token=f3b2451c-471c-4f71-87a7-bca2d234d391',
      gender: '',
      age: '0',
    );
    await FirestoreUsers().addUserToFirestore(userModel);
    setData(userModel);
  }

  void setData(UserModel userModel) async {
    await LocalStorageData().setDataUser(userModel);
  }
}
