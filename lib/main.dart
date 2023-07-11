import 'package:animation_project/controllers/game_controller.dart';
import 'package:animation_project/view/gamescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GameScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(GameController());
      }),
    );
  }
}
