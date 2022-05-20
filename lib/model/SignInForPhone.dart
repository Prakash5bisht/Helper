import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper/controller/OTPController.dart';
import 'package:helper/view/phone_view/CreatePin.dart';
import 'package:helper/view/phone_view/VerificationScreen.dart';
import 'package:helper/view/phone_view/custom_alert_box.dart';


class SignInForPhone {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  OTPController _controller = Get.find();

  Future<void> verifyPhoneNumber({BuildContext context, String dialCode, String phoneNumber, String screenId, bool resetPassword}) async {

    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {

      if (screenId == 'new_user_screen') {
        _controller.stopNextButtonProgress();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VerificationScreen(
                      countryCode: dialCode,
                      phoneNumber: phoneNumber,
                      verificationId: verId,
                      passwordReset: resetPassword,
                    )));
      }
    };

    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: '+$dialCode  ' + phoneNumber,
          timeout: Duration(seconds: 30),
          verificationCompleted: (AuthCredential credential) {
            // _auth.signInWithCredential(credential).then((AuthResult result){
            //  Navigator.pushNamed(context, ChatScreen.id);
            // });
            print(credential);
          },
          verificationFailed: (FirebaseAuthException exception) {
            print(exception.code);
            if (exception.code == 'quotaExceeded') {
              showAlert(context: context, alert: 'OOPS!', description: 'Too much attempts.Try again later.', defaultButtonName: 'OK');
            }
          },
          codeSent: smsOTPSent,
          codeAutoRetrievalTimeout: (String verId) {
            //  verificationId = verId;
          });
    } catch (e) {
      print(e);
    }
  }

  void showExceptionAsAlert(BuildContext context, FirebaseAuthException firebaseAuthException) {
    switch (firebaseAuthException.code) {
      case 'invalid-verification-code':
        showAlert(context: context, alert: 'Invalid Code', description: 'This is not the code that we sent to you.', defaultButtonName: 'OK');
        break;
      case 'session-expired':
        showAlert(context: context, alert: 'Expired', description: 'This code has expired.Try again.', defaultButtonName: 'OK');
        break;
      default:
        showAlert(context: context, alert: 'OOPS!', description: 'Something went wrong.', defaultButtonName: 'OK');
    }
  }

  void signIn({BuildContext context, String smsOTP, String verificationId, bool passwordReset}) async {

    if(smsOTP == null || smsOTP == ''){
      showAlert(context: context, alert: 'Uh oh!', description: 'Please enter the OTP', defaultButtonName: 'OK');
    }
    else if (smsOTP.length < 6) {
      showAlert(context: context, alert: 'Invalid Code', description: 'Enter a valid 6 digit code.', defaultButtonName: 'OK');
    } else{

      AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsOTP);

      await _auth.signInWithCredential(credential).then((UserCredential credential) {

        _controller.dismissProgress();

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreatePin(userId: credential.user.phoneNumber, resetPassword: passwordReset)));


      }).catchError((error) {
        showExceptionAsAlert(context, error);
      });

    }
  }
}
