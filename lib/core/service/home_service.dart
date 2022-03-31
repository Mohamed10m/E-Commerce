import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService{
  final CollectionReference _categoryCollection =
  FirebaseFirestore.instance.collection('categories');


  final CollectionReference _productCollection =
  FirebaseFirestore.instance.collection('products');


  Future getCategory() async {
    var value =  await _categoryCollection.get();
    return value.docs;
  }
  Future getProduct() async {
    var value =  await _productCollection.get();
    return value.docs;
  }
}