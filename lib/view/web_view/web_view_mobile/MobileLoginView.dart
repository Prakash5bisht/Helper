import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:helper/controller/LoginButtonController.dart';
import 'package:helper/model/web_model/UserVerification.dart';
import 'package:lottie/lottie.dart';

class MobileLoginView extends StatelessWidget {

  final phoneFieldController = TextEditingController();
  final pinFieldController = TextEditingController();
  final controller = Get.put(LoginButtonController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            //height: size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      color: Color(0xff304FFE),
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(48.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Helper',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  Container(
                                    height: 30.0,
                                    width: 30.0,
                                    child: Lottie.asset(
                                        'assets/LottieAnimations/whiteHand.json'),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            Text(
                              'Please LogIn\nTo Get Started',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 40.0,
                                  height: 1.2),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      width: size.width,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(38.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'LogIn',
                                style: TextStyle(
                                  color: Color(0xff616161),
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(height: 30.0,),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 50.0),
                                    child: TextField(
                                      controller: phoneFieldController,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(12)
                                      ],
                                      decoration: InputDecoration(
                                          hintText: 'Phone Number',
                                          fillColor: Color(0xffEEEEEE),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xff1fe593), width: 2.0),
                                            borderRadius: BorderRadius.circular(28.0),

                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(28.0),
                                          )
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 50.0),
                                    child: TextField(
                                      controller: pinFieldController,
                                      onChanged: (text){
                                        print(text);
                                      },
                                      keyboardType: TextInputType.number,
                                      obscureText: true,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(4)
                                      ],
                                      decoration: InputDecoration(
                                          hintText: 'Your Pin',
                                          fillColor: Color(0xffEEEEEE),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xff1fe593), width: 2.0),
                                            borderRadius: BorderRadius.circular(28.0),

                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(28.0),
                                          )
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0,),
                                  Obx((){
                                    return MaterialButton(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
                                      color: Color(0xff1fe593),
                                      onPressed: () {
                                        controller.showProgressIndicator();
                                        UserVerification().verifyUser(context, phoneFieldController.text, pinFieldController.text);

                                      },
                                      child: Container(
                                        width: 200,
                                        height: 50,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: controller.isVerifying() ?
                                            SizedBox(width: 15.0, height: 15.0,child: Center(child: CircularProgressIndicator(color: Colors.white,)))
                                                : Text(
                                              'LogIn',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
