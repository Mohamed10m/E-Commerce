import 'package:e_commerce/core/service/firestore_user.dart';
import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:e_commerce/shared/helper/local_storage_data.dart';

class ProfileViewModel extends GetxController {


  late UserModel userModel;


  LocalStorageData localStorageData = LocalStorageData();
  FirestoreUsers firestoreUsers = FirestoreUsers();

  bool get isProfileLoading => _isProfileLoading;
  bool _isProfileLoading = false;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
  }

  void sinOut() {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

  void getCurrentUser() async {
    _isProfileLoading = false;
    await firestoreUsers.getCurrentUser('${Get.find<AuthViewModel>().userId}').then((value) {
      userModel = UserModel.fromJson(value.data() as  Map<String,dynamic>);
    });
    _isProfileLoading = true;
    update();
  }
}