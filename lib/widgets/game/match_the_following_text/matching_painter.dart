// Match the following canvas (Where the lines are drawn).

import 'dart:ui';

import 'package:flutter/material.dart';

class MatchingPainter extends CustomPainter {
  final BuildContext context;
  final List<Offset> points;
  final List<List<Offset>> permanentLine;

  MatchingPainter({
    @required this.context,
    @required this.points,
    @required this.permanentLine,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Theme.of(context).primaryColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3.0;

    for (int i = 0; i < permanentLine.length; i++) {
      for (int j = 0; j < permanentLine[i].length - 1; j++) {
        canvas.drawLine(
          permanentLine[i][j],
          permanentLine[i][j + 1],
          paint,
        );
      }
    }

    paint
      ..color = Colors.amber
      ..strokeWidth = 1.5;
    for (int i = 0; i < points.length - 1; i++)
      canvas.drawLine(points[i], points[i + 1], paint);
  }

  @override
  bool shouldRepaint(MatchingPainter oldDelegate) {
    return oldDelegate.points != points;
  }
}
