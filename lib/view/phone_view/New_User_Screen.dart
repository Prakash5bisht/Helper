import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:helper/controller/OTPController.dart';
import 'package:helper/model/SignIn.dart';
import 'package:helper/view/phone_view/PhoneLogin.dart';

class NewUserScreen extends StatelessWidget {
  static const String id = 'new_user_screen';

  final bool passwordReset;

  NewUserScreen({this.passwordReset});

  final phoneNumController = TextEditingController();
  final countryCodeController = TextEditingController();
  final _otpController = Get.put(OTPController());

  final FocusNode phoneField = FocusNode();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    color: Color(0xff263238),
                    size: 28.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Flexible(
                // flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Welcome',
                        style: TextStyle(
                          color: Color(0xff304FFE),
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Flexible(
                        child: Text(
                          passwordReset == true
                              ? 'Reset Password'
                              : 'Create Account',
                          style: TextStyle(
                            color: Color(0xff595959),
                            fontWeight: FontWeight.w800,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                //flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          // width: 200.0,
                          height: size.height / 10.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: 0.3,
                                color: Color(0xffe8fdee),
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff2979FF).withOpacity(0.1),
                                  blurRadius: 10.0,
                                  // offset: Offset(0, 5)
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '+', // + dialCode,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff263238)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    controller: countryCodeController,
                                    focusNode: phoneField,
                                    maxLines: 1,
                                    style: TextStyle(height: 1.5),
                                    decoration: InputDecoration(
                                      hintText: 'Country Code',
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400]),
                                      border: InputBorder.none,
                                    ),
                                    cursorColor: Color(0xff263238),
                                    autofocus: false,
                                    textAlign: TextAlign.center,
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                            signed: false, decimal: false),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(3)
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: 35,
                                    child: VerticalDivider(
                                        thickness: 2.0,
                                        color: Color(0xffBDBDBD))),
                                Expanded(
                                  flex: 4,
                                  child: TextField(
                                    controller: phoneNumController,
                                    maxLines: 1,
                                    style: TextStyle(height: 1.5),
                                    decoration: InputDecoration(
                                      hintText: 'Phone Number',
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400]),
                                      border: InputBorder.none,
                                    ),
                                    keyboardType: TextInputType.phone,
                                    cursorColor: Color(0xff70768a),
                                    autofocus: false,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                //flex: 2,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Obx(() {
                      return MaterialButton(
                        color: Color(0xff304FFE),
                        minWidth: 0.0,
                        height: 50.0,
                        elevation: 5.0,
                        shape: CircleBorder(),
                        child: _otpController.nextButtonProgress.isTrue
                            ? SizedBox(
                                width: 15.0,
                                height: 15.0,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ))
                            : Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              ),
                        onPressed: () {
                          _otpController.startNextButtonProgress();
                          SignIn(
                              context: context,
                              countryCode: countryCodeController.text,
                              phoneNumber: phoneNumController.text,
                              passwordReset: passwordReset);
                          _otpController.stopNextButtonProgress();
                        },
                      );
                    }),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextButton(
                      onPressed: () {
                        if (passwordReset) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NewUserScreen(passwordReset: false)));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PhoneLogin()));
                        }
                      },
                      child: passwordReset == true
                          ? Text(
                              'SignUp',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : Text(
                              'Already a User?',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
