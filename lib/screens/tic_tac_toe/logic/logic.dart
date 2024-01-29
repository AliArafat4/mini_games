import 'package:flutter/material.dart';
import 'package:mini_games/constants/constants.dart';
import 'package:mini_games/constants/enums.dart';

class TicTacToeLogic {
  static IconData selectShape({required Shapes playerShape}) {
    switch (playerShape) {
      case Shapes.circle:
        return Icons.circle;

      case Shapes.triangle:
        return Icons.arrow_drop_up;

      case Shapes.square:
        return Icons.square;

      case Shapes.cross:
        return Icons.close;

      default:
        return Icons.diamond;
    }
  }

  //todo: need the player shape, played game
  static bool winCondition({required Map<Shapes, List<int>> check}) {
    //sort the player list
    check.values.first.sort((a, b) => a.compareTo(b));

    if (check.values.first.length >= 3) {
      for (var item in winningList) {
        final playerSet = Set.of(check.values.first);
        if (playerSet.containsAll(item)) {
          print("win");
          return true;
        }
      }
    }

    return false;
  }
}
