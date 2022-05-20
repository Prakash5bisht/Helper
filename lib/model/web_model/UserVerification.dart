import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper/controller/LoginButtonController.dart';
import 'package:helper/controller/UserIdController.dart';
import 'package:helper/view/phone_view/DashBoard.dart';
import 'package:helper/view/phone_view/custom_alert_box.dart';

import '../../view/web_view/home.dart';

class UserVerification{

    void verifyUser(BuildContext context, String phoneNumber, String pin) async{

      var firebaseReference = FirebaseDatabase.instance.ref().child('users');

      Map<dynamic, dynamic> userSnapshot;

     // controller.showProgressIndicator();
      DatabaseEvent event = await firebaseReference.once();
      userSnapshot = event.snapshot.value;

      if(kIsWeb){
        LoginButtonController controller = Get.find();
        controller.hideProgressIndicator();
      }

      if( (phoneNumber == null || pin == null) || (phoneNumber == '' || pin == '') ){

        showAlert(context: context, alert: 'OOPS!', description: 'Empty field', defaultButtonName: 'OK');

      }else if(userSnapshot == null){
        showAlert(context: context, alert: 'OOPS!', description: 'No user with this phone number is registered', defaultButtonName: 'OK');
      }
      else if(userSnapshot.containsKey('+91'+phoneNumber)){

          Map<dynamic, dynamic> values = userSnapshot['+91'+phoneNumber];

          String originalPin = values['password'];

          if(pin == originalPin){

            var userIdController = Get.put(UserIdController());
            userIdController.setUserId(phoneNumber);

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => kIsWeb ? Home() : DashBoard()));
          }else{
            showAlert(context: context, alert: 'OOPS!', description: 'Wrong Password', defaultButtonName: 'OK');
          }


      }else{

        showAlert(context: context, alert: 'OOPS!', description: 'No user with this phone number is registered', defaultButtonName: 'OK');

      }




    }
}