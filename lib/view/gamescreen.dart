import 'package:animation_project/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animation_project/view/winner_screen.dart';

class GameScreen extends StatelessWidget {
  GameScreen({super.key});

  final GameController controller = Get.put(GameController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      "Player X",
                      style: TextStyle(fontSize: 30, color: Colors.red),
                    ),
                    Obx(
                      () => Text(
                        controller.xScore.toString(),
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    const Text(
                      "Player O",
                      style: TextStyle(fontSize: 30, color: Colors.green),
                    ),
                    Text(
                      controller.oScore.toString(),
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      controller.onTapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 3, color: Colors.black)),
                      child: Center(
                        child: Obx(
                          () => Text(
                            controller.displayElement[index],
                            style: TextStyle(
                                fontSize: 40,
                                color: controller.getColor(
                                    controller.displayElement[index])),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          ElevatedButton(
              onPressed: controller.clearBoard,
              child: const Text(
                "ClearBoard",
                style: TextStyle(fontSize: 23),
              ))
        ],
      ),
    ));
  }
}
