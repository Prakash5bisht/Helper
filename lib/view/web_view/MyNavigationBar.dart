import 'package:flutter/material.dart';
import 'package:helper/view/web_view/CenteredView.dart';
import 'package:helper/view/web_view/LoginPage.dart';
import 'package:lottie/lottie.dart';

class MyNavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xffECEFF1),
      child: CenteredView(
        child: Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 40,
                    width: 100,
                    child: Text(
                      'Helper',
                      style: TextStyle(
                          fontSize: 26.0,
                          color: Color(0xff304FFE), fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(
                      height: 80,
                      width: 40,
                      child: Lottie.asset('assets/LottieAnimations/hand.json')),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 60.0),
                  TextButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                          fontSize: 18.0
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
