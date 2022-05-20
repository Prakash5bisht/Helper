import 'package:contacts_service/contacts_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helper/model/GetUserDataFromLocalDatabase.dart';
import 'package:helper/model/PermissionHandler.dart';
import 'package:helper/view/phone_view/custom_alert_box.dart';
import 'package:location/location.dart';
import 'package:sound_mode/sound_mode.dart';
import 'package:sound_mode/utils/ringer_mode_statuses.dart';

class StreamService{

  GetUserDataFromLocalDatabase _userDataFromLocalDatabase;
  String _usedId;
  final List<Marker> _myLocationMarker = [];


  StreamService(){
    _userDataFromLocalDatabase = GetUserDataFromLocalDatabase();
    _usedId = _userDataFromLocalDatabase.getUserId();
  }

  void _updateValue(var res){

    FirebaseDatabase.instance.ref().child('users').child(_usedId).child('contact').update(
        {
          'result' : res
        }
    );

  }

  void _changeSoundProfile(BuildContext context, String profile) async{
    try {

      if(profile == 'silent'){
        await SoundMode.setSoundMode(RingerModeStatus.silent);
      }else if(profile == 'vibrate'){
        await SoundMode.setSoundMode(RingerModeStatus.vibrate);
      }else if(profile == 'normal'){
        await SoundMode.setSoundMode(RingerModeStatus.normal);
      }

    }on PlatformException {
      showAlert(context: context, alert: 'NOT ALLOWED', description: 'Do not disturb permissions not enabled for current device! Please enable it from settings.', defaultButtonName: 'OK');
    }
  }






  Widget contactStream(){
    return StreamBuilder(
        stream: FirebaseDatabase.instance.ref().child('users').child(_usedId).child('contact').onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> event) {
          if(!event.hasData){
            return SizedBox(width: 10.0, height: 10.0, child: CircularProgressIndicator(color: Colors.blueAccent));
          }

          var value = event.data.snapshot.value;
          Map<dynamic, dynamic> contact = Map<dynamic, dynamic>.from(value);

          String query = contact['queries'];

          PermissionHandler permissionHandler = PermissionHandler();
          permissionHandler.myContacts(context, query).then((List<Contact> contacts){
            for (int i = 0; i < contacts.length; i++) {
              print(contacts[i].phones.first.value);
            }
            _updateValue(contacts[0].phones.first.value);
          });

          return Text(
            query,
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xff2962FF), fontWeight: FontWeight.w600),
          );
        }
    );
  }


  Widget callStream(){
    return StreamBuilder(
        stream: FirebaseDatabase.instance.ref().child('users').child(_usedId).child('ring').onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> event) {
          if(!event.hasData){
            return SizedBox(width: 10.0, height: 10.0, child: CircularProgressIndicator(color: Colors.blueAccent));
          }

          String query = event.data.snapshot.value;

          if(query == "play"){
            FlutterRingtonePlayer.playRingtone();
          }else{
            FlutterRingtonePlayer.stop();
          }


          return Text(
            query,
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xff2962FF), fontWeight: FontWeight.w600),
          );
        }
    );
  }


  Widget locationStream(){
    return StreamBuilder(
        stream: Location.instance.onLocationChanged,
        builder: (context, AsyncSnapshot<LocationData> currentLocation) {

          if(!currentLocation.hasData){
            return Center(
              child: SizedBox(
                  width: 15.0,
                  height: 15.0,
                  child: CircularProgressIndicator(
                    color: Colors.blueAccent,
                  )),
            );
          }

          double lat = currentLocation.data.latitude;
          double long = currentLocation.data.longitude;

          _myLocationMarker.add(Marker(markerId: MarkerId('1'), position: LatLng(lat,long)));

          return GoogleMap(
            markers: Set.from(_myLocationMarker),
            myLocationEnabled: true,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            initialCameraPosition: CameraPosition(target: LatLng(lat,long),
              zoom: 13.0,
            ),
          );
        }
    );
  }


  Widget soundProfileStream(){
    return StreamBuilder(
        stream: FirebaseDatabase.instance.ref().child('users').child('+916388828214').child('soundProfile').onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> event) {
          if(!event.hasData){
            return SizedBox(width: 10.0, height: 10.0, child: CircularProgressIndicator(color: Colors.blueAccent));
          }

          var value = event.data.snapshot.value;

          PermissionHandler permissionHandler = PermissionHandler();
          permissionHandler.askDNDPermissions(context).then( (granted){

            if(granted){
              _changeSoundProfile(context, value);
            }
          });

          return Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xff2962FF), fontWeight: FontWeight.w600),
          );
        }
    );
  }

}