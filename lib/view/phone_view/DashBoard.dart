import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helper/model/StreamService.dart';
import 'package:helper/view/phone_view/DashBoardAppBar.dart';
import 'package:helper/view/phone_view/Greeter.dart';
import 'package:helper/view/phone_view/UtilityCard.dart';

class DashBoard extends StatelessWidget {
  static const String id = 'helper_screen';

  final searchController = TextEditingController();
  final StreamService _streamService = StreamService();

  final List<Marker> _myLocationMarker = [];

  final List<Color> _gradient1 = [
    const Color(0xff06B782),
    const Color(0xffFC67A7),
    const Color(0xffFFD541),
    const Color(0xff441DFC),
  ];
  final List<Color> _gradient2 = [
    const Color(0xff06B782),
    const Color(0xffF6815B),
    const Color(0xffF0B31A),
    const Color(0xff4E81EB),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: size.height * .45,
              color: Color(0xff304FFE),
            ),
            Column(
              children: [
                SizedBox(height: 15.0,),
                DashBoardAppBar(),
                SizedBox(height: size.height/30),
                Greeter(),
                SizedBox(height: size.height/35),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            UtilityCard(title: 'Ring', description: 'Here you can check if ring request was made.', icon: Icons.phone_in_talk_rounded, stream: _streamService.callStream(), primaryColor: Color(0xffF6815B), secondaryColor: Color(0xffFFF3E0),),
                            SizedBox(height: 20.0),
                            UtilityCard(title: 'Contact', description: 'Here you can keep track of the contact requests being made to your device', icon: Icons.perm_identity_rounded, stream: _streamService.contactStream(), primaryColor: Color(0xff441DFC), secondaryColor: Color(0xffEDE7F6)),
                            SizedBox(height: 20.0),
                            UtilityCard(title: 'Sound Profile', description: 'Here you can check your sound profile.', icon: Icons.notifications, stream: _streamService.soundProfileStream(), primaryColor: Color(0xff00C853), secondaryColor: Color(0xffE8F5E9)),
                            SizedBox(height: 20.0),
//                            UtilityCard(title: 'Device Location', description: 'Here you can your device\'s current location ', icon: Icons.place_outlined, color1: Color(0xffFF6D00), color2: Color(0xffFFCC80),
//                            stream: Container(
//                              width: size.width,
//                              height: size.height/4,
//                              color: Colors.white,
//                              child: Center(
//                                child: ClipRRect(
//                                  borderRadius: BorderRadius.only(
//                                    bottomLeft: Radius.circular(12.0),
//                                    bottomRight: Radius.circular(12.0),
//                                  ),
//                                  child: _streamService.locationStream()
//                                ),
//                              ),
//                            ),
//                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

}
