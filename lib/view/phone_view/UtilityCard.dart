import 'package:flutter/material.dart';

class UtilityCard extends StatelessWidget {

  UtilityCard({this.icon, this.title, this.description, this.stream, this.primaryColor, this.secondaryColor});

  final IconData icon;
  final String title;
  final String description;
  final Widget stream;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height/5,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: secondaryColor,//Color(0xffE0E0E0)
            width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: secondaryColor
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Icon(icon, color: primaryColor),
                ),
                SizedBox(width: size.width/5),
                Container(
                  width: size.width/3,
                  height: 30,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(color: primaryColor, fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xffb3aab4)),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Request : ',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 5.0),
                stream,
              ],
            )
          ],
        ),
      ),
    );
  }
}
