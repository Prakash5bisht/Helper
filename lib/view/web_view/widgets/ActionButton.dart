import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key key,
    @required ScrollController scrollController,
  }) : _scrollController = scrollController, super(key: key);

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){
        _scrollController.jumpTo(_scrollController
            .position.maxScrollExtent);
        _scrollController.animateTo(321.4000244140625,
            duration: Duration(seconds: 0),
            curve: Curves.easeOut);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      elevation: 8.0,
      color: Color(0xff1fe593),
      child: Container(
        width: 200.0,
        height: 50.0,
        child: Center(
          child: Text(
            "Let's Start",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}