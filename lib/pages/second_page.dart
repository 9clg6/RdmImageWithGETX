import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_image/model/exo_controller.dart';
import 'package:random_image/model/link_manager.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key? key}) : super(key: key);
  final ExoController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              buildHeader(context),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Obx(() => Image(image: NetworkImage("${controller.imageUrl}"))),
              ),
              buildNewImageBtn(),
              const SizedBox(height: 20),
              buildCheckboxRow(),
              buildNewNicknameInput(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildNewNicknameInput() {
    return SizedBox(
      width: 150,
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "Nouveau nom",
        ),
        onChanged: (value) {
          controller.nickname.value = value;
        },
      ),
    );
  }

  Align buildHeader(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 20,
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "Bienvenue ${controller.nickname}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell buildNewImageBtn() {
    return InkWell(
      onTap: () {
        LinkManager.generateLink();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(10),
        width: 150,
        alignment: Alignment.center,
        child: const Text(
          "Nouvelle image",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }

  Row buildCheckboxRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => Row(
            children: [
              Checkbox(
                value: controller.isBlurActivated.value,
                onChanged: (value) {
                  controller.isBlurActivated.value = !controller.isBlurActivated.value;
                  controller.isGreyActivated.value = false;
                },
              ),
              const Text("Filtre flou"),
            ],
          ),
        ),
        Obx(
          () => Row(
            children: [
              Checkbox(
                value: controller.isGreyActivated.value,
                onChanged: (value) {
                  controller.isGreyActivated.value = !controller.isGreyActivated.value;
                  controller.isBlurActivated.value = false;
                },
              ),
              const Text("Filtre gris"),
            ],
          ),
        ),
      ],
    );
  }
}
