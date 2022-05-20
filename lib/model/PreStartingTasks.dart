import 'package:get/get.dart';
import 'package:helper/controller/SplashScreenController.dart';
import 'package:helper/model/UserProfileInformation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;




class PreStartingTasks{

  PreStartingTasks(){

    SplashScreenController myController = Get.put(SplashScreenController());

    _doPreStartingTasks();
  }

  Future<void> _doPreStartingTasks() async{

    final appDocumentDirectory = await pathProvider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    Hive.registerAdapter(UserProfileInformationAdapter());
    await Hive.openBox('UserProfileInformation');

  }
}