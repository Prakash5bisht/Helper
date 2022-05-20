import 'package:flutter/material.dart';

class IntroText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Hello,\nNeed Help?',
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 80,
                height: 0.9),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Helper is a cross-platform web and mobile application which allows you to access your device\'s data and its features remotely and the best part is, we do not store any of your sensitive data.',
            style: TextStyle(
                fontSize: 21,
                height: 1.7),
          ),
        ],
      ),
    );
  }
}
