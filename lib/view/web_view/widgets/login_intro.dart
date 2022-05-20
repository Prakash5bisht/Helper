import 'package:flutter/material.dart';
import 'package:helper/view/web_view/CenteredView.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginIntro extends StatelessWidget {

  const LoginIntro({@required this.screenType});

  final DeviceScreenType screenType;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        color: Color(0xff304FFE),
        width: screenType == DeviceScreenType.desktop ? size.width / 2 : double.infinity,
        height: screenType == DeviceScreenType.desktop ? double.infinity : size.height/2,
        child: CenteredView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'Helper',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: screenType == DeviceScreenType.desktop? 30.0 : 15.0,
                    ),
                  ),
                  Container(
                    height: screenType == DeviceScreenType.desktop ? 60.0 : 30.0,
                    width: screenType == DeviceScreenType.desktop ? 60.0 : 30.0,
                    child: Lottie.asset(
                        'assets/LottieAnimations/whiteHand.json'),
                  )
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                'Please LogIn\nTo Get Started',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: screenType == DeviceScreenType.desktop ? 70.0 : 35.0,
                    height: 0.9),
              ),
              SizedBox(
                height: 20.0,
              ),
//                      Container(
//                        child: Icon(Icons.arrow_forward_rounded, size: 50.0, color: Colors.white,),
//                      )
            ],
          ),
        ),
      ),
    );
  }
}