import 'package:flutter/material.dart';
import 'package:helper/view/web_view/web_view_desktop/home_view_desktop.dart';
import 'package:helper/view/web_view/web_view_mobile/home_view_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Home extends StatelessWidget {
  static const String id = 'home';

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context, sizingInformation) => Scaffold(
          backgroundColor: Colors.white,
          body: sizingInformation.deviceScreenType == DeviceScreenType.desktop ?
              HomeViewDesktop() : HomeViewMobile()
        )
    );
  }
}




