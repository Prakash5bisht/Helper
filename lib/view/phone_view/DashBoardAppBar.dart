import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper/controller/ProfileEditingController.dart';
import 'package:helper/view/phone_view/Settings.dart';

class DashBoardAppBar extends StatelessWidget {

  final _profileEditingController = Get.put(ProfileEditingController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: (){
                print('tapped');
              },
              child: Obx( (){
                return Hero(
                  tag: 'profilePhoto',
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xffFFF3E0),
                        borderRadius: BorderRadius.circular(50.0),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: Image.file(File(_profileEditingController.getProfilePhoto())).image,
                        )
                    ),
                  ),
                );
              })
          ),
          Text(
            'DashBoard',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 25.0),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(50.0)
              ),
              child: Icon(Icons.settings, color: Color(0xff424242)),
            ),
          )
        ],
      ),
    );
  }
}
