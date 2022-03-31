import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/view_model/profile_view_model.dart';
import 'package:e_commerce/model/shipping_address_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class FirebaseAddress {
  final CollectionReference _collectionReference = FirebaseFirestore.instance
      .collection('users')
      .doc(Get.find<ProfileViewModel>().userModel.uId)
      .collection('address');

  Future<void> addAddressToFirestore(AddressModel addressModel) async {
    return await _collectionReference.doc().set(addressModel.toJson());
  }
  Future<void> updateCheckBox(AddressModel addressModel,String id) async {
    return await _collectionReference.doc(id).update(addressModel.toJson());
  }

  Stream<QuerySnapshot> getAddress() {
    return  _collectionReference.snapshots();
  }
}