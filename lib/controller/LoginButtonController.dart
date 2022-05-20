import 'package:get/get.dart';

class LoginButtonController extends GetxController{

    var _processing = false.obs;

    bool isVerifying(){
      return _processing.value;
    }

    void showProgressIndicator(){
      _processing.value = true;
    }

    void hideProgressIndicator(){
      _processing.value = false;
      print(_processing.value);
    }
}