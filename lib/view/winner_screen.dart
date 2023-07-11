import 'package:animation_project/view/gamescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WinnerScreen extends StatefulWidget {
  final String winner;

  const WinnerScreen({required this.winner});

  @override
  State<WinnerScreen> createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<WinnerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Winner'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Congrulations',
                style: TextStyle(fontSize: 40, color: Colors.yellow),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                ' The winner is: ${widget.winner}',
                style: TextStyle(fontSize: 40, color: Colors.red),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => GameScreen());
                  },
                  child: Text("PlayAgain"))
            ],
          ),
        ),
      ),
    );
  }
}
