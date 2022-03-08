import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_image/model/exo_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /// Récupération du Controller initialisé dans le main
    /// La récupération est automatique
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
            buildNameForm(),
            buildStartBtn(controller),
          ],
        ),
      ),
    );
  }

  Form buildNameForm() {
    return Form(
      /// Clé uniquement du formulaire permettant d'enclencher la validation des
      /// formField enfants
      key: _formKey,
      child: SizedBox(
        width: 350,
        child: TextFormField(
          /// Controller du formField permettant de récupérer les données
          /// entrées par l'utilisateur
          controller: _textEditingController,
          validator: (value) {
            if (value == null || value.isEmpty || value == "") {
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
    );
  }

  InkWell buildStartBtn(ExoController controller) {
    return InkWell(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          ///Actualisation de la donnée dans le controller
          ///Les abonnés récevront automatiquement la mise à jour
          ///L'interface sera actualisé automatiquement si le widget affichant
          ///la donnée est stockée dans un widget observable "OBX"
          controller.nickname.value = _textEditingController.text;
          /// GetX met à disposition une API de navigation permettant de
          /// passer d'une page à l'autre sans context
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
    );
  }
}
