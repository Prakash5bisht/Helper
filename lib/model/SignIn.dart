import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'SignInForPhone.dart';
import '../view/phone_view/custom_alert_box.dart';

class SignIn{

  String _countryCode;
  String _phoneNumber;
  BuildContext _context;
  bool _passwordReset;

  SignIn({countryCode, phoneNumber, context, passwordReset}){
    this._countryCode = countryCode;
    this._phoneNumber = phoneNumber;
    this._context = context;
    this._passwordReset = passwordReset;

    _startSignInProcess();
  }

  void _startSignInProcess() {

    if(_phoneNumber.length == 0 || _phoneNumber.length < 10){
      showAlert(context: _context, alert: 'OOPS!', description: 'Please enter a valid phone number', defaultButtonName: 'OK');
    }else if(_countryCode.length == 0 ){
        showAlert(context: _context, alert: 'Sorry', description: 'Invalid country code', defaultButtonName: 'OK');
    }else{

      checkIfUserAlreadyExists('+'+_countryCode+_phoneNumber).then((exist){
        print(exist);
        print(_countryCode+_phoneNumber);
        if(_passwordReset){

            if(exist){
              SignInForPhone().verifyPhoneNumber(context: _context, dialCode: _countryCode, phoneNumber: _phoneNumber, screenId: 'new_user_screen', resetPassword: true);
            }else{
              showAlert(context: _context, alert: 'Sorry', description: 'No user with this number exists.Please SignUp.', defaultButtonName: 'OK');
            }

        }else{

            if(exist){
              showAlert(context: _context, alert: 'Sorry', description: 'User already exists\nTry to login', defaultButtonName: 'OK');
            }else{
              SignInForPhone().verifyPhoneNumber(context: _context, dialCode: _countryCode, phoneNumber: _phoneNumber, screenId: 'new_user_screen');
            }

        }

      });


    }


  }

  Future<bool> checkIfUserAlreadyExists(String userId) async{

    var firebaseReference = FirebaseDatabase.instance.ref().child('users');
    Map<dynamic, dynamic> userSnapshot;

    DatabaseEvent event = await firebaseReference.once();

    userSnapshot = event.snapshot.value;

    if(userSnapshot == null){
      return false;
    }else if(userSnapshot.containsKey(userId)){
      return true;
    }

    return false;

  }





}