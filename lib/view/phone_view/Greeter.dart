import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper/controller/ProfileEditingController.dart';

class Greeter extends StatelessWidget {

  ProfileEditingController _profileEditingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Obx( (){
          return Text(
            'Hello, ${_profileEditingController.getName()}',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22.0),
          );
        }),
      ),
    );
  }
}
