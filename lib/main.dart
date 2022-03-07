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