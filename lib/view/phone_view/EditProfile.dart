import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:helper/controller/ProfileEditingController.dart';
import 'package:helper/model/EditUserDataInDatabase.dart';
import 'package:helper/model/GetUserDataFromLocalDatabase.dart';

class EditProfile{

   TextEditingController _textFieldController = TextEditingController();
   GetUserDataFromLocalDatabase _userDataFromLocalDatabase = GetUserDataFromLocalDatabase();
   EditUserDataInDatabase _editUserDataInDatabase = EditUserDataInDatabase();
   ProfileEditingController _profileEditingController = Get.find();


  void showAlert({@required BuildContext context, bool editName}) {

    if(editName){
      _textFieldController.text =  _userDataFromLocalDatabase.getUserName();
    }

    var size = MediaQuery.of(context).size;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          // //Text(info, style: TextStyle(color: Colors.grey[700]),),
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Container(
              width: size.width/2,
              height: size.height / 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6.0, bottom: 6.0, left: 8.0, right: 8.0),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                child: TextField(
                                  controller: _textFieldController,
                                  maxLines: 1,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(editName ? 20 : 4)
                                  ],
                                  style: TextStyle(height: 1.5),
                                  decoration: InputDecoration(
                                    hintText: editName == false ? 'New Password' : '',
                                    hintStyle: TextStyle(color: Colors.grey[400]),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: editName ? TextInputType.text : TextInputType.phone,
                                  cursorColor: Color(0xff70768a),
                                  textAlign: TextAlign.center,
                                  autofocus: true,
                                ),
                              ),
                              Obx( (){
                                return Flexible(
                                    child: Text(
                                      _profileEditingController.getAlertText(),
                                      style: TextStyle(color: Colors.redAccent, fontSize: 12.0),
                                    )
                                );
                              })
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4.0), bottomRight: Radius.circular(4.0)),
                        color: Color(0xff304FFE),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  _profileEditingController.resetAlertText();
                                  Navigator.pop(context);
                                }),
                            SizedBox(
                              width: 6.0,
                            ),
                            TextButton(
                              //color: optionalButtonColor,
                              child: Text(
                                'OK',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: (){

                                if(_textFieldController.text.isEmpty){
                                  _profileEditingController.emptyField();
                                }else{

                                  if(editName){
                                    _profileEditingController.setName(_textFieldController.text);

                                    _profileEditingController.resetAlertText();
                                    Navigator.pop(context);

                                  }else{

                                    if(_textFieldController.text.length < 4){
                                      _profileEditingController.tooShortPassword();
                                    }else{
                                      _editUserDataInDatabase.resetPasswordInCloudDB(_textFieldController.text);

                                      _profileEditingController.resetAlertText();
                                      Navigator.pop(context);

                                    }

                                  }



                                }
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }



}