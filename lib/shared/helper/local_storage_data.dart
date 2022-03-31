import 'dart:convert';

import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/shared/constants/constants.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController {

  Future<UserModel?> get getUser async {
    try{
      UserModel userModel = await _getDataUser();
      if(userModel == null) return null;

      return userModel;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  setDataUser(UserModel userModel)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(CACHED_USER, json.encode(userModel.toMap()));
  }

  _getDataUser()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(CACHED_USER);
    return UserModel.fromJson(json.decode(value!));
  }

  deleteUser()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

}