import 'package:helper/model/UserProfileInformation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GetUserDataFromLocalDatabase{

  Box _localDB;
  UserProfileInformation _userProfileInformation;

    GetUserDataFromLocalDatabase(){
      _localDB = Hive.box('UserProfileInformation');
      _userProfileInformation = _localDB.getAt(0);
    }

    String getUserName(){
      String _name = _userProfileInformation.name;
      return _name;
    }

    String getUserId(){
      String _id = _userProfileInformation.userId;
      return _id;
    }

    String getProfilePhoto(){
      var _image = _userProfileInformation.profilePhoto;
      return _image;
    }

}