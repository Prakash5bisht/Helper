import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper/controller/LoginButtonController.dart';
import 'package:helper/model/web_model/UserVerification.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginField extends StatelessWidget {

  LoginField({@required this.screenType});

  final DeviceScreenType screenType;
  final phoneFieldController = TextEditingController();
  final pinFieldController = TextEditingController();
  final controller = Get.put(LoginButtonController());



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        color: Color(0xffECEFF1),
        width: screenType == DeviceScreenType.desktop ? size.width / 2 : double.infinity,
        height: screenType == DeviceScreenType.desktop ? double.infinity : size.height/2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              width: screenType == DeviceScreenType.desktop ? size.width / 3 : size.width/2,
              height: size.height / 2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffDCDCE5),
                      blurRadius: 10.0,
                    )
                  ]),
              child: Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'LogIn',
                    style: TextStyle(
                      color: Color(0xff616161),
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 50.0),
                        child: TextFormField(
                          controller: phoneFieldController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
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
                        child: TextFormField(
                          controller: pinFieldController,
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          textAlign: TextAlign.center,
                          maxLines: 1,
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
//                                  controller.hideProgressIndicator();

//                                  FirebaseDatabase.instance.ref().child('users').child('+916388828214').child('contact').update({
//                                    'queries': '',
//                                    'result' : ''
//                                  });

//                                  FirebaseDatabase.instance.ref().child('users').child('+916388828214').update({
//                                    'ring' : '',
//                                     'soundProfile' : '',
//                                    'location' : ''
//                                  });

//                                FirebaseDatabase.instance.ref().child('users').child('+916388828214').set({
//                                  'password' : '1234','queries' : '',
//                                  'result' : ''
//                                });
//
//                                FirebaseDatabase.instance.ref().child('users').child('+916388828214').child('Permissions').set({
//                                  'contact': true
//                                });

                          },
                          child: Container(
                            width: size.width/6,
                            height: size.height/16,
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
              )),
            ),
          ),
        ),
      ),
    );
  }
}