import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helper/controller/ServiceCardControllers/RemoteScreenAnimationController.dart';
import 'package:lottie/lottie.dart';


class ServiceCard extends StatelessWidget {

  ServiceCard({this.lottieAsset, this.controller, this.title, this.description, this.onTap});

  final String lottieAsset;
  final String title;
  final String description;
  final RemoteScreenAnimationController controller;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() {
      return InkWell(
        hoverColor: Color(0xff304FFE),
        onTap: onTap,
        onHover: (hovering) {
          if (hovering == true) {
            controller.startAnimation();
            controller.elevate();
            controller.logo.value = true;
          } else {
            controller.stopAnimation();
            controller.lowerDown();
            controller.logo.value = false;
          }
        },
        child: Column(
          children: [
            Container(
              child: Lottie.asset(
                lottieAsset,
                fit: BoxFit.fill,
                animate: controller.animate.value,
              ),
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                      color: Color(0xff06B782)
                  )
              ),
            ),
            Card(
              elevation: controller.elevation.value,
              shadowColor: Color(0xff424242),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.all(8.0),
                width: 200.0,
                height: 200.0,
                child: Center(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 45.0),
                      Flexible(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xff262626),
                              fontSize: 20.0,
                            ),
                          )),
                      SizedBox(height: 20.0),
                      Flexible(
                        child: Text(
                          description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff757575),
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 14.0),
                      controller.logo.value == true ?
                      Container( width: 30.0, height: 30.0, child: Lottie.asset('assets/LottieAnimations/hand.json'))
                          : Container()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
