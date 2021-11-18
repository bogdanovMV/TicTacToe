import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tic_tac_toe/shapes.dart';

import 'field.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<Shape?> shapes = List<Shape?>.filled(9, null);
  bool gameOver = false;
  bool moveX = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(gameOver
              ? AppLocalizations.of(context)!.winner + (moveX ? 'O' : 'X')
              : AppLocalizations.of(context)!.prompt + (moveX ? 'X' : 'O')),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Stack(children: <Widget>[
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
                          if (checkAvailable(index)) {
                            add(index);
                            checkWin();
                            moveX = !moveX;
                          }
                          setState(() {});
                        },
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool checkAvailable(int index) {
    return shapes[index] == null;
  }

  void add(int index) {
    if (moveX) {
      shapes[index] = Shape(shape: SHAPE.x, index: index, color: Colors.red);
    } else {
      shapes[index] = Shape(shape: SHAPE.o, index: index, color: Colors.green);
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

    if ((indexes.contains(0) && indexes.contains(1) && indexes.contains(2)) ||
        (indexes.contains(3) && indexes.contains(4) && indexes.contains(5)) ||
        (indexes.contains(6) && indexes.contains(7) && indexes.contains(8)) ||
        false ||
        (indexes.contains(0) && indexes.contains(3) && indexes.contains(6)) ||
        (indexes.contains(1) && indexes.contains(4) && indexes.contains(7)) ||
        (indexes.contains(2) && indexes.contains(5) && indexes.contains(8)) ||
        false ||
        (indexes.contains(0) && indexes.contains(4) && indexes.contains(8)) ||
        (indexes.contains(2) && indexes.contains(4) && indexes.contains(6))) {
      gameOver = true;
    }
  }
}
