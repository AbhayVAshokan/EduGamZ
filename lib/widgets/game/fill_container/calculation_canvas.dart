import 'package:flutter/material.dart';

class CalculationCanvas extends StatefulWidget {
  @override
  _CalculationCanvasState createState() => _CalculationCanvasState();
}

class _CalculationCanvasState extends State<CalculationCanvas> {
  List<List<Offset>> points = [];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (DragStartDetails details) {
        index = points.length;
        points.add([]);
      },
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          RenderBox renderBox = context.findRenderObject();
          points[index].add(
            renderBox.globalToLocal(
              details.globalPosition,
            ),
          );
        });
      },
      child: CustomPaint(
        painter: DrawingCanvas(
          points: points,
        ),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child: Text(
            'Calculation space',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}

// canvas where the calculation takes place
class DrawingCanvas extends CustomPainter {
  final List<List<Offset>> points;
  DrawingCanvas({@required this.points});

  @override
  bool shouldRepaint(DrawingCanvas oldDelegate) => true;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.teal[700]
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;

    for (int j = 0; j < points.length; j++) {
      for (int i = 0; i < points[j].length - 1; i++)
        canvas.drawLine(points[j][i], points[j][i + 1], paint);
    }
  }
}
