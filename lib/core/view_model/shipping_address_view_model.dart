import 'package:e_commerce/core/service/firebase_adress.dart';
import 'package:e_commerce/core/view_model/profile_view_model.dart';
import 'package:e_commerce/model/shipping_address_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ShippingAddressViewModel extends GetxController {
  final FirebaseAddress _firebaseAddress = FirebaseAddress();
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var streetController = TextEditingController();
  var zipController = TextEditingController();
  var countryController = TextEditingController();

  ShippingAddressViewModel() {
    getAddress();
  }

  void addAddressToFirebase() async {
    AddressModel addressModel = AddressModel(
      id: Get.find<ProfileViewModel>().userModel.uId,
      name: nameController.text,
      address: addressController.text,
      city: cityController.text,
      zip: zipController.text,
      street: streetController.text,
      country: countryController.text,
      isCheck: false,
    );
    await _firebaseAddress.addAddressToFirestore(addressModel);
    update();
  }

  void updateCheckBoxing(String id, AddressModel model) async {
    await _firebaseAddress.updateCheckBox(model, id);
    update();
  }

  List<AddressModel> addressModel = [];
  List<String> idAddress = [];

  void getAddress() {
    _firebaseAddress.getAddress().listen((event) {
      addressModel = [];
      event.docs.forEach((element) {
        addressModel
            .add(AddressModel.fromJson(element.data() as Map<String, dynamic>));
        idAddress.add(element.id);
      });
      print(addressModel[1].address);
    });
  }
}