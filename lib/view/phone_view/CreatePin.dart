import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helper/model/EditUserDataInDatabase.dart';
import 'package:helper/model/PreRegistrationTasks.dart';
import 'package:helper/view/phone_view/PhoneLogin.dart';


class CreatePin extends StatelessWidget {
  static const String id = 'CreatePin';

  final bool resetPassword;


  final String userId;
  final pinFieldController = TextEditingController();

   CreatePin({Key key, @required this.userId, this.resetPassword}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
                        resetPassword == true ? 'Reset Pin' : 'Set Pin',
                        style: TextStyle(color: Color(0xff304FFE), fontWeight: FontWeight.w600, fontSize: 18.0),
                      ),
                      SizedBox(height: 8.0),
                      Flexible(
                        child: Text(
                          'Create a four digit pin',
                          style: TextStyle(
                            color: Color(0xff393d48),
                            fontWeight: FontWeight.w600,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 6.0),
                      Flexible(
                        child: Text(
                          'Do not forget this pin.\nYou will need this pin to access your device.',
                          style: TextStyle(
                            color: Color(0xff757575),
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  children: <Widget>[
                    Container(
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
                          controller: pinFieldController,
                          maxLines: 1,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4)
                          ],
                          style: TextStyle(height: 1.5),
                          decoration: InputDecoration(
                            hintText: 'Pin',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.phone,
                          cursorColor: Color(0xff70768a),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 35.0),
                    Flexible(
                      child: MaterialButton(
                        height: 45.0,
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                        color: Color(0xff304FFE),
                        child: resetPassword == true ? Text(
                          'Reset',
                          style: TextStyle(color: Colors.white),
                        )
                            : Text(
                          'Create',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {

                          if(resetPassword == true){
                            EditUserDataInDatabase _editUserDataInDatabase = EditUserDataInDatabase();
                            _editUserDataInDatabase.resetPasswordInCloudDB(pinFieldController.text);
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PhoneLogin()));
                          }else {
                            PreRegistrationTasks tasks = PreRegistrationTasks(userId: userId, pin: pinFieldController.text, context: context);
                            tasks.startPreRegistrationTasks();
                          }

                        },
                      ),
                    ),
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
