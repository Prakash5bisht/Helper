import 'package:get/get.dart';

class UserIdController extends GetxController{

  var _userId = ''.obs;

  void setUserId(String userId){
    _userId.value = '+91'+userId;
  }


  String getUserId(){
    return _userId.value;
  }
}