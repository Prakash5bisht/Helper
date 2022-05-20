import 'package:get/get.dart';
import 'RemoteScreenAnimationController.dart';

class LocationCardController extends RemoteScreenAnimationController{


  var animate = false.obs;
  var elevation = 8.0.obs;
  var logo = false.obs;


  void elevate(){
    elevation.value = 40.0;
  }

  void lowerDown(){
    elevation.value = 8.0;
  }

  void startAnimation(){
    animate.value = true;
  }

  void stopAnimation(){
    animate.value = false;
  }
}