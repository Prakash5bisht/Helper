import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper/model/UserProfileInformation.dart';
import 'package:helper/view/phone_view/CreatePin.dart';
import 'package:helper/view/phone_view/PhoneLogin.dart';
import 'package:helper/view/phone_view/Settings.dart';
import 'package:helper/view/web_view/LoginPage.dart';
import 'package:helper/view/web_view/home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'view/phone_view/DashBoard.dart';
import 'view/phone_view/New_User_Screen.dart';
import 'view/phone_view/splash_screen.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if(!kIsWeb){
    final appDocumentDirectory = await pathProvider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    Hive.registerAdapter(UserProfileInformationAdapter());
    await Hive.openBox('UserProfileInformation');
  }

 // SplashScreenController myController = Get.put(SplashScreenController());

  // PreStartingTasks();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: kIsWeb ? LoginPage.id : SplashScreen.id,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans')
      ),
      routes: {
        LoginPage.id: (context) => LoginPage(),
        Home.id: (context) => Home(),
        PhoneLogin.id: (context) => PhoneLogin(),
        CreatePin.id: (context) => CreatePin(),
        SplashScreen.id: (context) => SplashScreen(),
        NewUserScreen.id: (context) => NewUserScreen(),
        DashBoard.id: (context) => DashBoard(),
        Settings.id: (context) => Settings(),
      }, // Application name
    );
  }
}
