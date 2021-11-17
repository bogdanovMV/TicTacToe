import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  const Field({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: FieldPainter(color: Theme.of(context).cardColor),
    );
  }
}

class FieldPainter extends CustomPainter {
  final Color color;

  FieldPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final offsetWidth = size.width / 3;
    final offsetHeight = size.height / 3;


    final line = Paint()
      ..color = color
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;
    for (int i = 1; i <= 2; i++) {
      canvas.drawLine(
        Offset(offsetWidth * i, 0),
        Offset(offsetWidth * i, height),
        line,
      );

      canvas.drawLine(
        Offset(0, offsetHeight * i),
        Offset(width, offsetHeight * i),
        line,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter _) => false;
}
