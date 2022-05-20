import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helper/controller/UserIdController.dart';
import 'package:lottie/lottie.dart';


class UseService {

  UserIdController _userIdController;
  String _userId;

  UseService(){
    _userIdController = Get.find();
    _userId = _userIdController.getUserId();
  }

  void contactDialog(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final controller = TextEditingController();
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            child: Container(
              width: screenSize.width / 3,
              height: screenSize.height / 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.cancel_outlined,
                            size: 30.0,
                            color: Color(0xff616161),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Search for contact',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w600,
                                color: Colors.blueAccent,
                            ),
                          ),
                          SizedBox(height: 50,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 60.0),
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: controller,
                              decoration: InputDecoration(
                                hintText: 'Search',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3, color: Color(0xffBDBDBD)),
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3, color: Color(0xff304FFE)),
                                  borderRadius: BorderRadius.circular(26),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          MaterialButton(
                            color: Color(0xff304FFE),
                            onPressed: (){
                              FirebaseDatabase.instance.ref().child('users').child(_userId).child('contact').update({
                                'queries' : controller.text
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Get',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          StreamBuilder(
                              stream: FirebaseDatabase.instance.ref().child('users').child(_userId).child('contact').onValue,
                              builder: (context, AsyncSnapshot<DatabaseEvent> event){
                                if(!event.hasData){
                                  return SizedBox(width: 15.0, height: 15.0,child: Center(child: CircularProgressIndicator(color: Colors.blue,)));
                                }

                                var value = event.data.snapshot.value;
                                Map<dynamic, dynamic> contact = Map<dynamic, dynamic>.from(value);

                                String response = contact['result'];


                                return Text(response);
                              })
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  void ringDialog(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            child: Container(
              width: screenSize.width / 4,
              height: screenSize.height / 3,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.cancel_outlined,
                            size: 30.0,
                            color: Color(0xff616161),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Container(
                        width: 60.0,
                        height: 60.0,
                        child: Lottie.asset('assets/LottieAnimations/ring.json', animate: true),
                      ),
                      SizedBox(height: 30.0,),
                      MaterialButton(
                        color: Color(0xff1fe593),
                        onPressed: (){
                          FirebaseDatabase.instance.ref().child('users').child(_userId).update({
                            'ring' : 'play',
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Ring',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      MaterialButton(
                        color: Color(0xff1fe593),
                        onPressed: (){
                          FirebaseDatabase.instance.ref().child('users').child(_userId).update({
                            'ring' : 'pause',
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Stop',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
//                    SizedBox(height: 10.0,),
//                    Text('Ringing...'),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  void soundProfileDialog(BuildContext context){

    var screenSize = MediaQuery.of(context).size;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            child: Container(
              width: screenSize.width / 3,
              height: screenSize.height / 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.cancel_outlined,
                            size: 30.0,
                            color: Color(0xff616161),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Container(
                        width: 80.0,
                        height: 80.0,
                        child: Lottie.asset('assets/LottieAnimations/soundMode.json', animate: true),
                      ),
                      SizedBox(height: 30.0,),
                      MaterialButton(
                        color: Color(0xff1fe593),
                        onPressed: (){
                          FirebaseDatabase.instance.ref().child('users').child(_userId).update({
                            'soundProfile' : 'normal',
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'General',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      MaterialButton(
                        color: Color(0xff1fe593),
                        onPressed: (){
                          FirebaseDatabase.instance.ref().child('users').child(_userId).update({
                            'soundProfile' : 'silent',
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Silent',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      MaterialButton(
                        color: Color(0xff1fe593),
                        onPressed: (){
                          FirebaseDatabase.instance.ref().child('users').child(_userId).update({
                            'soundProfile' : 'vibrate',
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Vibrate',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });

  }

  void currentLocationDialog(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            child: Container(
              width: screenSize.width / 3,
              height: screenSize.height / 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.cancel_outlined,
                            size: 30.0,
                            color: Color(0xff616161),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Text(
                        'Your device\'s current location',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600,
                            color: Colors.blueAccent
                        ),
                      ),
                      StreamBuilder(
                          stream: FirebaseDatabase.instance.ref().child('users').child(_userId).child('location').onValue,
                          builder: (context, AsyncSnapshot<DatabaseEvent> event) {
                            if (!event.hasData) {
                              return SizedBox(width: 15.0,
                                  height: 15.0,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.blue,)));
                            }
                             List currentLocation = event.data.snapshot.value;
                             double lat = currentLocation[0];
                             double long = currentLocation[1];

                            return Container(
                              width: screenSize.width / 3,
                              height: screenSize.height / 2,
                              child: GoogleMap(
                                //markers: Set.from(currentLocation),
                                myLocationEnabled: true,
                                scrollGesturesEnabled: true,
                                zoomGesturesEnabled: true,
                                initialCameraPosition: CameraPosition(target: LatLng(lat,long),
                                  zoom: 13.0,
                                ),
                              ),
                            );
                          }

                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
