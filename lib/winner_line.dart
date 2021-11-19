import 'dart:math';

import 'package:flutter/material.dart';

enum POSITION {
  top,
  bottom,
  left,
  right,
  centerHorizontal,
  centerVertical,
  rightTilt,
  leftTilt
}

class WinnerLine extends StatelessWidget {
  final POSITION _position;

  const WinnerLine.top() : _position = POSITION.top;

  const WinnerLine.bottom() : _position = POSITION.bottom;

  const WinnerLine.left() : _position = POSITION.left;

  const WinnerLine.right() : _position = POSITION.right;

  const WinnerLine.centerHorizontal() : _position = POSITION.centerHorizontal;

  const WinnerLine.centerVertical() : _position = POSITION.centerVertical;

  const WinnerLine.rightTilt() : _position = POSITION.rightTilt;

  const WinnerLine.leftTilt() : _position = POSITION.leftTilt;

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).appBarTheme.backgroundColor!;
    return CustomPaint(
      size: Size.infinite,
      painter: _WinnerLinePainter(_position, color),
    );
  }
}

class _WinnerLinePainter extends CustomPainter {
  final POSITION position;
  final Color color;
  _WinnerLinePainter(this.position, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final _line = Paint()
      ..color = color
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;
    double sx, sy, ex, ey;
    switch (position){
      case POSITION.top:
        sy = ey = size.width / 6;
        sx = 0;
        ex = size.width;
        break;
      case POSITION.bottom:
        sy = ey = size.width / 6 * 5;
        sx = 0;
        ex = size.width;
        break;
      case POSITION.left:
        sx = ex = size.width / 6;
        sy = 0;
        ey = size.width;
        break;
      case POSITION.right:
        sx = ex = size.width / 6 * 5;
        sy = 0;
        ey = size.width;
        break;
      case POSITION.centerHorizontal:
        sy = ey = size.width / 2;
        sx = 0;
        ex = size.width;
        break;
      case POSITION.centerVertical:
        sx = ex = size.width / 2;
        sy = 0;
        ey = size.width;
        break;
      case POSITION.rightTilt:
        sx = ey = 0;
        sy = ex = size.width;
        break;
      case POSITION.leftTilt:
        sx = sy = 0;
        ex = ey = size.width;
        break;
    }

    sx += Random(2).nextInt(15);
    sy += Random(12).nextInt(15);
    ex += Random(85).nextInt(15);
    ey += Random(06).nextInt(15);

    canvas.drawLine(
      Offset(sx, sy),
      Offset(ex, ey),
      _line,
    );

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
