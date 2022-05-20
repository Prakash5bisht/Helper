import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:helper/controller/OTPController.dart';
import 'package:helper/model/SignInForPhone.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class VerificationScreen extends StatefulWidget {
  final String phoneNumber, countryCode;
  final String verificationId;
  final bool passwordReset;
  VerificationScreen({this.countryCode, this.phoneNumber, this.verificationId, this.passwordReset});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final otpController = Get.put(OTPController());

  final otpFieldController = TextEditingController();

  @override
  void initState() {
    otpController.startOtpValidationTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    size: 28.0,
                  ),
                  color: Color(0xff263238),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Verification',
                        style: TextStyle(color: Color(0xff304FFE), fontWeight: FontWeight.w600, fontSize: 18.0),
                      ),
                      SizedBox(height: 8.0),
                      Flexible(
                        child: Text(
                          'We sent you an SMS code',
                          style: TextStyle(
                            color: Color(0xff393d48),
                            fontWeight: FontWeight.w600,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Row(
                        children: <Widget>[
                          Text(
                            'Phone number:',
                            style: TextStyle(color: Color(0xff70768a), fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            '+' + widget.countryCode,
                            style: TextStyle(color: Color(0xff599ae0), fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            widget.phoneNumber,
                            style: TextStyle(color: Color(0xff599ae0), fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        width: size.width/2,
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
                            controller: otpFieldController,
                            maxLines: 1,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6)
                            ],
                            style: TextStyle(height: 1.5),
                            decoration: InputDecoration(
                              hintText: 'OTP',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.phone,
                            cursorColor: Color(0xff70768a),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Obx((){
                      return Text(
                        otpController.start > 9 ? '00:${otpController.start}' : '00:0${otpController.start}',
                        style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w500),
                      );
                    })
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      height: 45.0,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                      color: Color(0xff304FFE),
                      child: Obx(() {
                        return otpController.inProgress.isTrue
                            ? SizedBox(width: 15.0, height: 15.0,child: CircularProgressIndicator(color: Colors.white,))
                            : Text(
                          'Verify',
                          style: TextStyle(color: Colors.white),
                        );
                        }
                      ),

                      onPressed: () {
                        //otpController.showProgress();
                        SignInForPhone().signIn(context: context, smsOTP: otpFieldController.text, verificationId: widget.verificationId, passwordReset: widget.passwordReset);
                      },
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Didn\'t received code?',
                          style: TextStyle(color: Color(0xff9b9aac), fontWeight: FontWeight.w500),
                        ),
                        Obx(() {
                            return otpController.resendButtonProgress.isTrue ?
                            SizedBox(width: 15.0, height: 15.0,child: Center(child: CircularProgressIndicator(color: Color(0xff304FFE),)))
                            : TextButton(
                                child: Text(
                                  'Resend',
                                  style: TextStyle(
                                    color: otpController.start >= 1 ? Colors.grey : Color(0xff304FFE),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                onPressed: () async{
                                  otpController.startResendButtonProgress();
                                  await otpController.verifyAndSignIn(context: context, start: otpController.start, countryCode: widget.countryCode, phoneNumber: widget.phoneNumber, resetPassword: widget.passwordReset);
                                  otpController.stopResendButtonProgress();
                                });
                          }
                        ),
                      ],
                    )
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
