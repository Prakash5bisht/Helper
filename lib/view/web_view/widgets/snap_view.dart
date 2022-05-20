import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helper/controller/ServiceCardControllers/ContactCardController.dart';
import 'package:helper/controller/ServiceCardControllers/LocationCardController.dart';
import 'package:helper/controller/ServiceCardControllers/RingCardController.dart';
import 'package:helper/controller/ServiceCardControllers/SoundModeCardController.dart';
import 'package:helper/view/web_view/ServiceCard.dart';
import 'package:helper/view/web_view/UseService.dart';
import 'package:responsive_builder/responsive_builder.dart';


class SnapView extends StatefulWidget {

  @override
  State<SnapView> createState() => _SnapViewState();
}

class _SnapViewState extends State<SnapView> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    List<Widget> _children = getCards(context);
    int length = _children.length;
    int _index = 0;

    return Center(
      child: SizedBox(
        height: 200,
        width: size.width/2,
        child: PageView.builder(
          itemCount: 4,
          controller: PageController(viewportFraction: 0.7),
          onPageChanged: (int index) => setState(() => _index = index),
          itemBuilder: (_, i) {
            return Transform.scale(
              scale: i == _index ? 1 : 0.9,
              child: Center(
                child: _children[i]
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> getCards(BuildContext context){

    DeviceScreenType mobile = DeviceScreenType.mobile;

    List<Widget> _services = [
      ServiceCard(
        controller: ContactCardController(),
        lottieAsset: 'assets/LottieAnimations/contacts.json',
        title: 'Get Contact',
        description: 'Get any contact number from your phone.',
        onTap: (){UseService().contactDialog(context);},
      ),
      ServiceCard(
        controller: RingCardController(),
        lottieAsset: 'assets/LottieAnimations/ring.json',
        title: 'Ring',
        description: 'Ring your phone.',
        onTap: (){UseService().ringDialog(context);},
      ),
      ServiceCard(
        controller: SoundModeCardController(),
        lottieAsset: 'assets/LottieAnimations/soundMode.json',
        title: 'Sound Profile',
        description: 'Change sound profile.',
        onTap: (){UseService().ringDialog(context);},
      ),
      ServiceCard(
        controller: LocationCardController(),
        lottieAsset: 'assets/LottieAnimations/location.json',
        title: 'Location',
        description: 'Get current location of your device.',
        onTap: (){UseService().ringDialog(context);},
      )
    ];

    return _services;

  }
}
