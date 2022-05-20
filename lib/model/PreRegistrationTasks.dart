import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:helper/view/phone_view/DashBoard.dart';
import 'package:helper/view/phone_view/custom_alert_box.dart';

import 'RegisterUserInLocalDatabase.dart';

class PreRegistrationTasks{

   String _userId;
   String _pin;
   BuildContext _context;

   final _databaseReference = FirebaseDatabase.instance.ref();


   PreRegistrationTasks({@required userId, @required pin, @required context}){
     _userId = userId;
     _pin = pin;
     _context = context;

   }

   void startPreRegistrationTasks(){

     if(checkIfPinIsValid(_pin, _context)){

       createNewUser(_userId, _pin);

     }

   }

  void createNewUser(String userId, String pin){


    _databaseReference.child('users').child(userId).set({
      'password' : pin,
      'ring' : '',
      'soundProfile' : '',
      'location' : ''
    });


    _databaseReference.child('users').child(userId).child('Permissions').set({
      'contact' : true
    });


    _databaseReference.child('users').child(userId).child('contact').set({
      'queries': '',
      'result' : ''
    });

    _databaseReference.child('users').child(userId).child('profile').set({
      'name': userId,
      'profilePhoto' : ''
    });

    Navigator.pushReplacement(_context, MaterialPageRoute(builder: (context) => DashBoard()));
    RegisterUserInLocalDatabase(userId);
  }

  bool checkIfPinIsValid(String pin, BuildContext context){

    if( pin == null || pin == ''){
      showAlert(context: context, alert: 'OOPS!', description: 'Empty field', defaultButtonName: 'OK');
      return false;
    }else if(pin.length < 4){
      showAlert(context: context, alert: 'OOPS!', description: 'Invalid Pin', defaultButtonName: 'OK');
      return false;
    }
    return true;

  }

}