import 'dart:io' as i;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FirestoreUsers {
  final CollectionReference _collectionReference =
  FirebaseFirestore.instance.collection('users');

  Future<void> addUserToFirestore(UserModel userModel) async {
    print(userModel.name);
    return await _collectionReference.doc(userModel.uId).set(userModel.toMap());
  }

  Future<DocumentSnapshot> getCurrentUser(String id) async {
    return await _collectionReference.doc(id).get();
  }

  Future<void> updateCurrentUser(String id, UserModel model) async {
    return await _collectionReference.doc(id).update(model.toMap());
  }

  Future uploadImageUserFirebase(
      String path, i.File fileImage) async {
    return await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(path).pathSegments.last}')
        .putFile(fileImage);
  }



}