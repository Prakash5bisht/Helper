import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:helper/controller/ProfileEditingController.dart';
import 'package:helper/model/GetUserDataFromLocalDatabase.dart';
import 'package:helper/model/UserProfileInformation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class EditUserDataInDatabase{

  Box _localDB;
  UserProfileInformation _userProfileInformation;
  final _databaseReference = FirebaseDatabase.instance.ref();
  GetUserDataFromLocalDatabase _userDataFromLocalDatabase = GetUserDataFromLocalDatabase();



  EditUserDataInDatabase(){
    _localDB = Hive.box('UserProfileInformation');
    _userProfileInformation = _localDB.getAt(0);
  }

  void updateUserName(String newName){

   String _userId = _userProfileInformation.userId;
   bool _isLoggedIn = _userProfileInformation.isLoggedIn;
   var _profilePhoto = _userProfileInformation.profilePhoto;


    _localDB.putAt(0, UserProfileInformation(_userId, _isLoggedIn, newName, _profilePhoto));


    _databaseReference.child('users').child(_userDataFromLocalDatabase.getUserId()).child('profile').update({
      'name': newName,

    });
  }

  void resetPasswordInCloudDB(String newPassword){
    _databaseReference.child('users').child(_userDataFromLocalDatabase.getUserId()).update({
      'password' : newPassword,
    });

  }

  void changeProfilePhoto(XFile image) async{

    String _userId = _userProfileInformation.userId;
    bool _isLoggedIn = _userProfileInformation.isLoggedIn;
    String _name = _userProfileInformation.name;


   _localDB.putAt(0, UserProfileInformation(_userId, _isLoggedIn, _name, image.path));

    _databaseReference.child('users').child(_userDataFromLocalDatabase.getUserId()).child('profile').update({
      'profilePhoto' : image.path,
    });

  }



}