import 'package:flutter/material.dart';
import 'package:helper/view/web_view/LoginPage.dart';
import 'package:helper/view/web_view/widgets/clip.dart';
import 'package:helper/view/web_view/widgets/list_of_services.dart';
import 'package:lottie/lottie.dart';

class HomeViewMobile extends StatelessWidget {

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                color: Color(0xffECEFF1),
                child: Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 60,
                              child: Text(
                                'Helper',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color(0xff304FFE), fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(
                                height: 50,
                                width: 30,
                                child: Lottie.asset('assets/LottieAnimations/hand.json')),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                              fontSize: 14.0
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Hello,\nNeed Help?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 40,
                                  height: 0.9),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Helper is a cross-platform web and mobile application which allows you to access your device\'s data and its features remotely and the best part is, we do not store any of your sensitive data.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  height: 1.7),
                            ),
                            AnimationClip(),
                            SizedBox(
                              height: 30
                            ),
                            MaterialButton(
                              onPressed: (){
                                _scrollController.jumpTo(_scrollController
                                    .position.maxScrollExtent);
                                _scrollController.animateTo(321.4000244140625,
                                    duration: Duration(seconds: 0),
                                    curve: Curves.easeOut);
                              },
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                              elevation: 8.0,
                              color: Color(0xff1fe593),
                              child: Container(
                                width: 200.0,
                                height: 50.0,
                                child: Center(
                                  child: Text(
                                    "Let's Start",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                width: size.width,
                padding: EdgeInsets.symmetric(vertical: 70.0, horizontal: 30.0),
                color: Color(0xff304FFE),
                child: Column(
                  children: [
                    Text(
                      'Our Services',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 40,
                          height: 0.9,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ListOfServices(web: false)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
