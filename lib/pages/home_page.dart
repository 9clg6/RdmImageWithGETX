import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_image/model/exo_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ExoController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Image(
              image: AssetImage("assets/my_logo.png"),
              width: 200,
              height: 200,
            ),
            const Text("Bienvenue dans votre application"),
            Form(
              key: _formKey,
              child: SizedBox(
                width: 350,
                child: TextFormField(
                  controller: _textEditingController,
                  validator: (value) {
                    if(value == null || value.isEmpty || value == ""){
                      return "Merci d'insérer du texte";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Veuillez insérer votre nom",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if(_formKey.currentState!.validate()){
                  controller.nickname.value = _textEditingController.text;
                  Get.toNamed('/secondPage');
                }
              },
              child: Container(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Démarrer",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

