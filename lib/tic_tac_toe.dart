import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tic_tac_toe/shapes.dart';
import 'package:tic_tac_toe/themes.dart';
import 'package:tic_tac_toe/winner_line.dart';

import 'field.dart';
import 'ai.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  bool aiMode = false;
  AI ai = AI();

  List<Shape?> shapes = List<Shape?>.filled(9, null);
  bool gameOver = false;
  bool draw = false;
  bool moveX = true;

  WinnerLine? _winnerLine;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: newGame,
          icon: const Icon(Icons.autorenew_outlined),
        ),
        title: Text(AppLocalizations.of(context)!.title),
        actions: [
          Center(child: Text(AppLocalizations.of(context)!.ai)),
          Switch(
            inactiveThumbColor: Colors.grey,
            value: aiMode,
            onChanged: (on) {
              aiMode = on;
              newGame();
            },
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 60),
            child: Text(gameOver
                ? (draw
                    ? AppLocalizations.of(context)!.draw
                    : AppLocalizations.of(context)!.winner +
                        (moveX ? 'O' : 'X'))
                : AppLocalizations.of(context)!.prompt + (moveX ? 'X' : 'O')),
          ),
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Stack(
                    children: <Widget>[
                      const Field(),
                      if (shapes.isNotEmpty)
                        GridView.count(
                          crossAxisCount: 3,
                          children: shapes
                              .map((e) => (e != null)
                                  ? Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: e,
                                    )
                                  : Container())
                              .toList(),
                        ),
                      GridView.count(
                        crossAxisCount: 3,
                        children: List.generate(
                          9,
                          (index) => GestureDetector(
                            onTap: () {
                              tap(index);
                            },
                          ),
                        ),
                      ),
                      if (gameOver && !draw) _winnerLine!,
                      if (gameOver)
                        GestureDetector(
                          onTap: () {
                            newGame();
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void newGame() {
    ai = AI();
    shapes = List<Shape?>.filled(9, null);
    draw = false;
    gameOver = false;
    moveX = true;
    _winnerLine = null;
    setState(() {});
  }

  bool checkAvailable(int index) {
    return shapes[index] == null;
  }

  void tap(int index) {
    if (!checkAvailable(index) || gameOver) {
      return;
    }
    if (aiMode && moveX) {
      move(index);
      moveX = false;
      if (!gameOver) {
        Timer(
          Duration(milliseconds: 1500),
          () {
            int _nextIndex = ai.getNextIndex(index);
            move(_nextIndex);
            moveX = true;
          },
        );
      }
    }

    if (!aiMode) {
      move(index);
      moveX = !moveX;
    }
  }

  void move(int index) {
    add(index);
    checkWin();
    setState(() {});
  }

  void add(int index) {
    if (moveX) {
      shapes[index] =
          Shape(shape: SHAPE.x, index: index, color: ColorsShape.colorX);
    } else {
      shapes[index] =
          Shape(shape: SHAPE.o, index: index, color: ColorsShape.colorO);
    }
  }

  void checkWin() {
    List<int> indexes = [];
    for (var shape in shapes) {
      if (shape != null) {
        if (moveX && shape.shape == SHAPE.x) indexes.add(shape.index);
        if (!moveX && shape.shape == SHAPE.o) indexes.add(shape.index);
      }
    }

    if (indexes.contains(0) && indexes.contains(1) && indexes.contains(2)) {
      _winnerLine = const WinnerLine.top();
    }
    if (indexes.contains(3) && indexes.contains(4) && indexes.contains(5)) {
      _winnerLine = const WinnerLine.centerHorizontal();
    }
    if (indexes.contains(6) && indexes.contains(7) && indexes.contains(8)) {
      _winnerLine = const WinnerLine.bottom();
    }
    if (indexes.contains(0) && indexes.contains(3) && indexes.contains(6)) {
      _winnerLine = const WinnerLine.left();
    }
    if (indexes.contains(1) && indexes.contains(4) && indexes.contains(7)) {
      _winnerLine = const WinnerLine.centerVertical();
    }
    if (indexes.contains(2) && indexes.contains(5) && indexes.contains(8)) {
      _winnerLine = const WinnerLine.right();
    }
    if (indexes.contains(0) && indexes.contains(4) && indexes.contains(8)) {
      _winnerLine = const WinnerLine.leftTilt();
    }
    if (indexes.contains(2) && indexes.contains(4) && indexes.contains(6)) {
      _winnerLine = const WinnerLine.rightTilt();
    }

    if (_winnerLine != null) {
      gameOver = true;
    } else if (!shapes.contains(null)) {
      gameOver = true;
      draw = true;
    }
  }
}
