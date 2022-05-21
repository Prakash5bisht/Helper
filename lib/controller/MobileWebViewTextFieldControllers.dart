import 'package:get/get.dart';

class MobileWebViewTextFieldControllers extends GetxController{

  var _phoneNumber = ''.obs;
  var _password = ''.obs;


  void changePhoneNumber(String value){
    _phoneNumber.value = value;
  }

  String getPhoneNumber(){
    return _phoneNumber.value;
  }

  void changePassword(String value){
    _password.value = value;
  }

  String getPassword(){
    return _password.value;
  }

}