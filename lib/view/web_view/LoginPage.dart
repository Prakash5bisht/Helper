import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper/controller/LoginButtonController.dart';
import 'package:helper/model/web_model/UserVerification.dart';
import 'package:helper/view/web_view/CenteredView.dart';
import 'package:helper/view/web_view/web_view_desktop/DesktopLoginView.dart';
import 'package:helper/view/web_view/widgets/login_intro.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'web_view_mobile/MobileLoginView.dart';
import 'widgets/login_field.dart';

class LoginPage extends StatelessWidget {
  static const String id = 'LoginPage';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ResponsiveBuilder(
      builder: (context, sizingInformation)=> Scaffold(
        body: SafeArea(
          child: sizingInformation.deviceScreenType == DeviceScreenType.desktop ?
              DesktopLoginView() : MobileLoginView()
      ),
    )
    );
  }
}



