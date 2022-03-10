import 'dart:math';

import 'package:get/get.dart';
import 'package:random_image/model/exo_controller.dart';

class LinkManager {

  ///Construction du lien permettant de récupérer les images en fonction
  ///des combobox (cochées ou non)
  static void generateLink(){
    final ExoController controller = Get.find();
    String finalUrl = "https://picsum.photos/";

    if(!controller.isBlurActivated.value && !controller.isGreyActivated.value){
      finalUrl += "${Random().nextInt(300)}";
    } else if(controller.isGreyActivated.value){
      finalUrl += "${Random().nextInt(300)}?grayscale";
    } else if(controller.isBlurActivated.value){
      finalUrl += "${Random().nextInt(300)}?blur";
    }
    controller.imageUrl.value = finalUrl;
  }
}