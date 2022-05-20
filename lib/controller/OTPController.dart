import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper/model/SignInForPhone.dart';

class OTPController extends GetxController{

   var start = 0.obs;
   var inProgress = false.obs;
   var nextButtonProgress = false.obs;
   var resendButtonProgress = false.obs;

   void startOtpValidationTimer() {

     if(start.value == 0){
       start.value = 30;
     }

     const _oneSecond = const Duration(seconds: 1);

     Timer.periodic(_oneSecond, (timer) {

         if (start < 1) {
           start.value = 0;
           timer.cancel();
         } else {
             start--;
         }

     });

   }

  Future<void> verifyAndSignIn({BuildContext context, var start, String countryCode, String phoneNumber, bool resetPassword}) async{

    if (start == 0) {

     await SignInForPhone().verifyPhoneNumber(context: context, dialCode: countryCode, phoneNumber: phoneNumber, resetPassword: resetPassword);
      startOtpValidationTimer();

    }
  }

  void showProgress(){
     inProgress.value = true;
  }

  void dismissProgress(){
    inProgress.value = false;
  }

  void startNextButtonProgress(){
     nextButtonProgress.value = true;
  }

   void stopNextButtonProgress(){
     nextButtonProgress.value = false;
   }

   void startResendButtonProgress(){
     resendButtonProgress.value = true;
   }

   void stopResendButtonProgress(){
     resendButtonProgress.value = false;
   }

}