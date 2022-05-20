import 'package:flutter/material.dart';
import '../view/phone_view/New_User_Screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    MediaQueryData screenSize = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(//mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.chevron_left_rounded, color: Color(0xff1EE856), size: 30.0),
                onPressed: () {
                  print('back');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenSize.size.height / 5.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(screenSize.size.width / 16.0, screenSize.size.height / 25.0, screenSize.size.width / 2.0, 0.0),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      color: Color(0xff1EE856),
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
                    splashColor: Color(0xff36F449).withOpacity(0.5),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NewUserScreen()));
                    },
                    child: Container(
                      height: 50.0,
                      width: 166.0,
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(24.0)), color: Color(0xff1EE856), boxShadow: [
                        BoxShadow(color: Color(0xff36F449).withOpacity(0.5), blurRadius: 6.0, offset: Offset(1.0, 1.0), spreadRadius: 1.0)
                      ]),
                      child: Center(
                        child: Text(
                          'New User',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      // side: BorderSide(color: Color(0xff36F449) ),
                    ),
                    splashColor: Color(0xff36F449).withOpacity(0.5),
                    onPressed: () {
                      print('existing');
                    },
                    child: Container(
                      height: 50.0,
                      width: 166.0,
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(24.0)), color: Colors.white, boxShadow: [
                        BoxShadow(color: Color(0xff36F449).withOpacity(0.3), blurRadius: 6.0, offset: Offset(1.0, 1.0), spreadRadius: 1.0)
                      ]),
                      child: Center(
                        child: Text(
                          'Existing',
                          style: TextStyle(
                            color: Color(0xff1EE856),
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
