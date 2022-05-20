import 'package:hive/hive.dart';

part 'UserProfileInformation.g.dart';

@HiveType(typeId: 0)
class UserProfileInformation{

   @HiveField(0)
   String userId;

   @HiveField(1)
   bool isLoggedIn;

   @HiveField(2)
   String name;

   @HiveField(3)
   var profilePhoto;

   UserProfileInformation(this.userId, this.isLoggedIn, this.name, this.profilePhoto);
}