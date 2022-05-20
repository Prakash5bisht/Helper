import 'dart:developer';

import 'package:get/get.dart';


class SplashScreenController extends GetxController{

  var inProgress = false.obs;

   @override
  void onInit() {
    log('splash');
    super.onInit();
  }

  void showProgress(){
     inProgress.value = true;
  }

  void completeProgress(){
    inProgress.value = false;
  }


}