import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_image/model/exo_controller.dart';
import 'package:random_image/pages/home_page.dart';
import 'package:random_image/pages/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Initialisation du controller dans l'application. Une fois le PUT
    /// effectué, le controller peut être récupéré depuis n'importe quel endroit de l'application
    /// Cela permet donc de ne pas avoir à se transmettre des objets par paramètre.
    /// Et donc simplifier les appels de méthodes / chaînes d'appels.
    Get.put(ExoController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages : [
        GetPage(
          name: '/',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/secondPage',
          page: () => SecondPage(),
        ),
      ],
    );
  }
}