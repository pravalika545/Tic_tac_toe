import 'dart:ui';
import 'package:animation_project/view/winner_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  RxBool oTurn = true.obs;
  RxList<String> displayElement = ['', '', '', '', '', '', '', '', ''].obs;
  RxInt xScore = 0.obs;
  RxInt oScore = 0.obs;
  RxInt filledBoxes = 0.obs;
  Color getColor(String player) {
    if (player == 'X') {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  void clearBoard() {
    displayElement.value = ['', '', '', '', '', '', '', '', ''];
    filledBoxes.value = 0;
    oTurn.value = true;
  }

  void clearScoreBoard() {
    xScore = 0.obs;
    oScore = 0.obs;

    filledBoxes.value = 0;
  }

  void onTapped(int index) {
    if (displayElement[index] == '') {
      if (oTurn.value) {
        displayElement[index] = 'X';
      } else {
        displayElement[index] = 'O';
      }
      filledBoxes++;
      oTurn.toggle();
      checkWinner();
    }
  }

  void checkWinner() {
    if (displayElement[0] == displayElement[1] &&
        displayElement[0] == displayElement[2] &&
        displayElement[0] != '') {
      navigateToWinnerScreen(displayElement[0]);
    }
    if (displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[5] &&
        displayElement[3] != '') {
      navigateToWinnerScreen(displayElement[3]);
    }
    if (displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] != '') {
      navigateToWinnerScreen(displayElement[6]);
    }
    if (displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] != '') {
      navigateToWinnerScreen(displayElement[0]);
    }
    if (displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7] &&
        displayElement[1] != '') {
      navigateToWinnerScreen(displayElement[1]);
    }
    if (displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8] &&
        displayElement[2] != '') {
      navigateToWinnerScreen(displayElement[2]);
    }
    if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != '') {
      navigateToWinnerScreen(displayElement[0]);
    }
    if (displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6] &&
        displayElement[2] != '') {
      navigateToWinnerScreen(displayElement[2]);
    } else if (filledBoxes == 9) {}
  }

  void navigateToWinnerScreen(String winner) {
    clearBoard();
    Get.to(() => WinnerScreen(winner: winner));

    if (winner == 'X') {
      xScore++;
    } else if (winner == 'O') {
      oScore++;
    }
  }
}
