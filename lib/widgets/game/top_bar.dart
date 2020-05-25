// Display the top bar containing game stats.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    showComingSoon() {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text('Coming Soon'),
        ),
        barrierDismissible: true,
      );
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: showComingSoon,
              child: CustomPaint(
                painter: RankBarPainter(),
                child: Container(
                  height: 60.0,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Rank: 4/10',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomPaint(
              child: Container(
                height: 60.0,
                width: MediaQuery.of(context).size.width * 0.4 + 60,
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Timer: 00:00',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              painter: TimerBarPainter(),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: showComingSoon,
              child: Center(
                child: CustomPaint(
                  child: Container(
                    height: 60.0,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Game 1/15',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                        ),
                      ),
                    ),
                  ),
                  painter: GameBarPainter(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Rank bar
class RankBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = const Color(0xffd1b2d2);

    final Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..relativeLineTo(-60, -size.height)
      // ..relativeQuadraticBezierTo(15, 0, 0, -15)
      ..close();
    canvas.drawPath(path, paint);

    // canvas.drawShadow(path, Colors.black, 5.0, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Timer bar
class TimerBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.yellow;

    final Path path = Path()
      ..relativeLineTo(60, size.height)
      // ..relativeQuadraticBezierTo(-15, 0, 15, 0)
      ..lineTo(size.width * 0.8, size.height)
      // ..relativeQuadraticBezierTo(15, 0, 30, -15)
      ..relativeLineTo(60, -size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Game bar
class GameBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = const Color(0xff8eb6de);

    final Path path = Path()
      ..moveTo(60, 0)
      ..lineTo(0, size.height)
      // ..relativeQuadraticBezierTo(0, -15, 15, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
