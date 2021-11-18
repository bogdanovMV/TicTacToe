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
            ? _XPainter(color: color, index: index)
            : _OPainter(color: color, index: index));
  }
}

abstract class _Shape extends CustomPainter {
  final Color color;
  final int index;
  late final Paint _line;

  _Shape({required this.color, required this.index}) {
    _line = Paint()
      ..color = color
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;
  }

  @override
  bool shouldRepaint(covariant CustomPainter _) => false;
}

class _OPainter extends _Shape {
  _OPainter({required Color color, required int index})
      : super(color: color, index: index);

  @override
  void paint(Canvas canvas, Size size) {
    final _radius = size.width / 2;
    canvas.drawCircle(
      Offset(size.width / 2, size.width / 2),
      _radius,
      _line,
    );
  }
}

class _XPainter extends _Shape {
  _XPainter({required Color color, required int index})
      : super(color: color, index: index);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      Offset(0, 0),
      Offset(size.width, size.width),
      _line,
    );
    canvas.drawLine(
      Offset(0, size.width),
      Offset(size.width, 0),
      _line,
    );
  }
}
