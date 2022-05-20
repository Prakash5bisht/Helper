import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../view/phone_view/DashBoard.dart';
import '../view/phone_view/custom_alert_box.dart';
import 'user_credentials.dart';

class SignInForWeb {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<ConfirmationResult> signInForWeb(BuildContext context, UserCredentials userCred) async {
    String dialCode = userCred.countryCode;
    String phoneNum = userCred.phoneNumber;

    ConfirmationResult _confirmationResult = await _auth.signInWithPhoneNumber(
      '+' + dialCode + ' ' + phoneNum,
      RecaptchaVerifier(
        container: null,
        size: RecaptchaVerifierSize.normal,
        onSuccess: () => print('success'),
        onError: (FirebaseAuthException error) => print(error),
        onExpired: () => print('reCAPTCHA Expired!'),
      ),
    );

    return _confirmationResult;
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

  void confirmOTP(BuildContext context, ConfirmationResult confirmationResult, String otp) {
    if (otp.length < 6) {
      showAlert(context: context, alert: 'Invalid Code', description: 'Enter a valid 6 digit code.', defaultButtonName: 'OK');
    } else {
      try {
        confirmationResult.confirm(otp).then((result) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoard()));
        });
      } catch (error) {
        showExceptionAsAlert(context, error);
      }
    }
  }
}
