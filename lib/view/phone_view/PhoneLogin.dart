import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helper/model/web_model/UserVerification.dart';
import 'package:helper/view/phone_view/New_User_Screen.dart';
import 'custom_alert_box.dart';

class PhoneLogin extends StatelessWidget {
  static const String id = "PhoneLogin";

  final phoneNumberController = TextEditingController();
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25.0),
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
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: Color(0xff304FFE),
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'LogIn',
                      style: TextStyle(
                        color: Color(0xff595959),
                        fontWeight: FontWeight.w800,
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 17.0, right: 17.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        // width: 200.0,
                        height: size.width / 6,
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
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: phoneNumberController,
                            maxLines: 1,
                            style: TextStyle(height: 1.5),
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.phone,
                            cursorColor: Color(0xff70768a),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        // width: 200.0,
                        height: size.width / 6,
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
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: pinController,
                            maxLines: 1,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6)
                            ],
                            style: TextStyle(height: 1.5),
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.phone,
                            cursorColor: Color(0xff70768a),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                //flex: 2,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      color: Color(0xff304FFE),
                      minWidth: 0.0,
                      height: 50.0,
                      elevation: 5.0,
                      shape: CircleBorder(),
                      child: Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        UserVerification().verifyUser(context, phoneNumberController.text, pinController.text);
                      },
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextButton(
                      onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewUserScreen(passwordReset: true)));
                        //ToDo: implement login
                      },
                      child: Text(
                        'Forgot Password?',
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
