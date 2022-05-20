import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:helper/controller/OTPController.dart';
import 'package:helper/controller/SplashScreenController.dart';
import 'package:helper/model/UserProfileInformation.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

import 'DashBoard.dart';
import 'New_User_Screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        
        Timer(Duration(seconds: 4), (){
          doBackendTasks();
        });

    });

  }

  void doBackendTasks(){

    var localDB = Hive.box('UserProfileInformation');

    if(localDB.isEmpty){
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewUserScreen(passwordReset: false)));
    }else{
      UserProfileInformation userProfileInfo = localDB.getAt(0);
      bool isAlreadyLoggedIn = userProfileInfo.isLoggedIn;

      if(isAlreadyLoggedIn){

         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashBoard()));

      }else{
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewUserScreen(passwordReset: false)));
      }


    }

  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4361ee),
      body: SafeArea(
        child: Center(
          child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Helper',
                    style: TextStyle(color: Colors.white, fontSize: 34.0, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 10.0,),
                  SizedBox(width: 60.0, height: 60.0,child: Lottie.asset('assets/LottieAnimations/whiteHand.json'),)
                ]
              ),
        ),
      ),
    );
  }
}
