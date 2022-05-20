import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper/controller/ProfileEditingController.dart';
import 'package:helper/model/EditUserDataInDatabase.dart';
import 'package:helper/model/GetUserDataFromLocalDatabase.dart';
import 'package:helper/view/phone_view/EditProfile.dart';
import 'package:helper/view/phone_view/PhoneLogin.dart';


class Settings extends StatelessWidget {

  static const String id = 'Settings';

  final GetUserDataFromLocalDatabase _userDataFromLocalDatabase = GetUserDataFromLocalDatabase();
  final EditUserDataInDatabase _editUserDataInDatabase = EditUserDataInDatabase();
  final ProfileEditingController _profileEditingController = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.chevron_left,
                        color: Color(0xff263238),
                        size: 28.0,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: size.width/5),
                    Text(
                      'Settings',
                      style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w800, fontSize: 20.0),
                    ),
                  ],
                ),
                SizedBox(height: size.height/14),
                Column(
                  children: [
                    Stack(
                      children: [
                        Obx( (){
                          return Hero(
                            tag: 'profilePhoto',
                            child: Container(
                              width: size.width/4,
                              height: size.width/4,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: Image.file(File(_profileEditingController.getProfilePhoto())).image,
                                  ),
                                  borderRadius: BorderRadius.circular(100.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffDCDCE5),
                                      blurRadius: 6.0,
                                    )
                                  ]),
                            ),
                          );
                        }),
                        Positioned(
                            top: size.height/12,
                            left: size.width/5.4,
                            child: Container(
                                height: size.width/16,
                                width: size.width/16,
                                decoration: BoxDecoration(
                                color: Color(0xff304FFE),
                                borderRadius: BorderRadius.circular(100.0),
                                ),
                              child: GestureDetector(
                                  onTap: (){
                                    _profileEditingController.changeProfilePhoto();
                                  },
                                  child: Icon(Icons.create_outlined, color: Colors.white, size: 15.0),
                              ),
                            )
                        )
                      ],
                    ),
                    SizedBox(height: size.width/10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx( (){
                          return Text(
                            _profileEditingController.getName(),
                            style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w600, fontSize: 16),
                          );
                        }),
                        SizedBox(width: 6),
                        Container(
                          height: size.width/16,
                          width: size.width/16,
                          color: Colors.white,
                          child: GestureDetector(
                              onTap: (){
                                EditProfile().showAlert(context: context, editName: true);
                              },
                              child: Icon(Icons.create_outlined, color: Color(0xffBDBDBD), size: 16.0),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: size.height/18),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text('Phone Number', style: TextStyle(color: Color(0xffBDBDBD), fontSize: 14.0),),
                        Container(
                          height: size.height / 10.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: 0.6,
                                color: Color(0xffBDBDBD),//Color(0xff00C853)//Color(0xffe8fdee),
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Center(child: Text('+916388828214', style: TextStyle(color: Color(0xffBDBDBD), fontSize: 18.0))),
                        ),
                      SizedBox(height: 20.0,),
                      Text('Password', style: TextStyle(color: Color(0xffBDBDBD), fontSize: 14.0),),
                      Container(
                        height: size.height / 10.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 0.6,
                              color: Color(0xffBDBDBD),//Color(0xff00C853)//Color(0xffe8fdee),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: size.width/8),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 18.0),
                                child: Text('....', style: TextStyle(color: Color(0xffBDBDBD), fontSize: 34.0, fontWeight: FontWeight.w600),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: (){
                                    EditProfile().showAlert(context: context, editName: false);
                                  },
                                  child: Icon(Icons.create_outlined, color: Color(0xffBDBDBD), size: 20.0),
                                ),
                              )
                            ],
                        )),
                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PhoneLogin()));
                          },
                          child: Text('Log Out', style: TextStyle(color: Colors.blueAccent, fontSize: 14.0, fontWeight: FontWeight.w600),),

                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
