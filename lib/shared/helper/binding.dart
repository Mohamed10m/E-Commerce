import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/core/view_model/checkout_view_model.dart';
import 'package:e_commerce/core/view_model/controll_view_model.dart';
import 'package:e_commerce/core/view_model/edit_profile_view_model.dart';
import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/core/view_model/profile_view_model.dart';
import 'package:e_commerce/core/view_model/shipping_address_view_model.dart';
import 'package:e_commerce/shared/helper/local_storage_data.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => ProfileViewModel());
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.put(() => HomeViewModel());
    Get.put(() => CartViewModel(), permanent: true);
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => CheckOutViewModel());
    Get.lazyPut(() => EditProfileViewModel());
    Get.put(() => ShippingAddressViewModel(),permanent: true);
    Get.lazyPut(() => CheckOutViewModel());
  }
}