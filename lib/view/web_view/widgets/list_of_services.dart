import 'package:flutter/material.dart';
import 'package:helper/controller/ServiceCardControllers/ContactCardController.dart';
import 'package:helper/controller/ServiceCardControllers/LocationCardController.dart';
import 'package:helper/controller/ServiceCardControllers/RingCardController.dart';
import 'package:helper/controller/ServiceCardControllers/SoundModeCardController.dart';
import 'package:helper/view/web_view/ServiceCard.dart';
import 'package:helper/view/web_view/UseService.dart';

class ListOfServices extends StatelessWidget {

  final bool web;

  const ListOfServices({@required this.web});

  @override
  Widget build(BuildContext context) {
    return web ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _list(context)
    ) : Column(
      children: _list(context),
    );
  }

}

List<Widget> _list(BuildContext context){
  UseService _useService = UseService();
  return [
    ServiceCard(
      controller: ContactCardController(),
      lottieAsset: 'assets/LottieAnimations/contacts.json',
      title: 'Get Contact',
      titleColor: Color(0xffF6815B),
      description: 'Get any contact number from your phone.',
      onTap: (){_useService.contactDialog(context);},
    ),
    ServiceCard(
      controller: RingCardController(),
      lottieAsset: 'assets/LottieAnimations/ring.json',
      title: 'Ring',
      titleColor: Color(0xff00B8D4),
      description: 'Ring your phone.',
      onTap: (){_useService.ringDialog(context);},
    ),
    ServiceCard(
      controller: SoundModeCardController(),
      lottieAsset: 'assets/LottieAnimations/soundMode.json',
      title: 'Sound Profile',
      titleColor: Color(0xff00C853),
      description: 'Change sound profile.',
      onTap: (){_useService.soundProfileDialog(context);},
    ),
    ServiceCard(
      controller: LocationCardController(),
      lottieAsset: 'assets/LottieAnimations/location.json',
      title: 'Location',
      titleColor: Color(0xffFF1744),
      description: 'Get current location of your device.',
      onTap: (){_useService.currentLocationDialog(context);},
    )
  ];
}
