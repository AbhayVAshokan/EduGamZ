// Login behind coloring the beaker

import 'dart:ui';
import 'dart:async';

import 'package:flutter/material.dart';

class ColoringCanvas extends StatefulWidget {
  @override
  _ColoringCanvasState createState() => _ColoringCanvasState();
}

class _ColoringCanvasState extends State<ColoringCanvas> {
  List<Offset> points = [];
  final containerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      key: containerKey,
      painter: Sketcher(points: points, context: context),
      child: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            RenderBox box = context.findRenderObject();
            Offset point = box.globalToLocal(details.globalPosition);

            points = List.from(points)..add(point);
          });
        },
        onPanEnd: (DragEndDetails details) {
          Timer(
            const Duration(seconds: 1),
            () => Navigator.pushReplacementNamed(
              context,
              '/gameCircleAnswer',
            ),
          );
          points.add(null);
        },
        child: CustomPaint(
          painter: BeakerCanvas(context: context),
          child: Container(
            height: 225,
            width: 160.714285714,
          ),
        ),
      ),
    );
  }
}

// CustomPainter class to generate the beaker shape
class BeakerCanvas extends CustomPainter {
  final BuildContext context;
  BeakerCanvas({@required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Theme.of(context).primaryColor.withOpacity(0.15);

    Path path = Path()
      ..moveTo(2 / 25 * size.width, 3 / 17 * size.height)
      ..lineTo(2 / 25 * size.width, 8.95 / 10 * size.height)
      ..quadraticBezierTo(size.width / 2, size.height * 1.08,
          15 / 16 * size.width, 8.97 / 10 * size.height)
      ..lineTo(15 / 16 * size.width, 8.97 / 10 * size.height)
      ..lineTo(15 / 16 * size.width, 3 / 17 * size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// CustomPainter class to color the touched area
class Sketcher extends CustomPainter {
  final List<Offset> points;
  final BuildContext context;

  Sketcher({
    @required this.points,
    @required this.context,
  });

  @override
  bool shouldRepaint(Sketcher oldDelegate) {
    return oldDelegate.points != points;
  }

  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Theme.of(context).primaryColor.withOpacity(0.3)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }
}

// extension to find the global position of the widget on the screen
extension GlobalKeyEx on GlobalKey {
  Rect get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    var translation = renderObject?.getTransformTo(null)?.getTranslation();
    if (translation != null && renderObject.paintBounds != null) {
      return renderObject.paintBounds
          .shift(Offset(translation.x, translation.y));
    } else {
      return null;
    }
  }
}
