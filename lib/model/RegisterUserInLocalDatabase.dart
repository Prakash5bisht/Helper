





import 'package:helper/model/UserProfileInformation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RegisterUserInLocalDatabase{

  RegisterUserInLocalDatabase(String userId){
    var user = UserProfileInformation(userId, true, userId, '');
    final userProfileInformationBox = Hive.box('UserProfileInformation');
    userProfileInformationBox.add(user);
  }

}