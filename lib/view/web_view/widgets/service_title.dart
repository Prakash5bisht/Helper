import 'package:flutter/material.dart';
import 'package:helper/view/web_view/CenteredView.dart';

class ServiceTitle extends StatelessWidget {
  final double fontSize;

  const ServiceTitle({this.fontSize});

  @override
  Widget build(BuildContext context) {
    return CenteredView(
      child: Text(
        'Our Services',
        style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: fontSize,//50,
            height: 0.9,
            color: Colors.white),
      ),
    );
  }
}