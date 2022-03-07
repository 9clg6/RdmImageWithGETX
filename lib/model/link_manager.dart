import 'dart:math';

import 'package:get/get.dart';
import 'package:random_image/model/exo_controller.dart';

class LinkManager {

  static void generateLink(){
    final ExoController controller = Get.find();
    String finalUrl = "https://picsum.photos/";

    if(!controller.isBlurActivated.value && !controller.isGreyActivated.value){
      finalUrl += "${Random().nextInt(500)}";
    } else if(controller.isGreyActivated.value){
      finalUrl += "${Random().nextInt(500)}?grayscale";
    } else if(controller.isBlurActivated.value){
      finalUrl += "${Random().nextInt(500)}?blur";
    }
    controller.imageUrl.value = finalUrl;
  }
}