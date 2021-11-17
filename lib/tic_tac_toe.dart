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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Stack(
              children: [
                Field(),
                Shape(shape: SHAPE.x, color: Colors.red, index: 0),
                Shape(shape: SHAPE.o, color: Colors.green, index: 2),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


