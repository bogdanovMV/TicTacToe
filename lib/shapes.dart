import 'package:flutter/material.dart';

enum SHAPE { x, o }

class Shape extends StatelessWidget {
  final SHAPE shape;
  final int index;
  final Color color;

  const Shape(
      {Key? key, required this.shape, required this.index, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        size: Size.infinite,
        painter: (shape == SHAPE.x)
            ? XPainter(color: color, index: index)
            : OPainter(color: color, index: index));
  }
}

abstract class _Shape extends CustomPainter {
  final Color color;
  final int index;
  late final Paint line;

  _Shape({required this.color, required this.index}) {
    line = Paint()
      ..color = color
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;
  }

  @override
  bool shouldRepaint(covariant CustomPainter _) => false;
}

class OPainter extends _Shape {
  OPainter({required Color color, required int index})
      : super(color: color, index: index);

  @override
  void paint(Canvas canvas, Size size) {
    final offsetWidth = size.width / 2;
    final offsetHeight = size.height / 2;
    final radius =
        offsetWidth < offsetHeight ? size.width / 2.5 : size.height / 2.5;

    canvas.drawCircle(
      Offset(offsetWidth, offsetHeight),
      radius,
      line,
    );
  }
}

class XPainter extends _Shape {
  XPainter({required Color color, required int index})
      : super(color: color, index: index);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      Offset(0, 0),
      Offset(size.width, size.height),
      line,
    );

    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width, 0),
      line,
    );
  }
}
