// Display the top bar containing game stats.

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

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
      height: mediaQuery.size.height * 0.15,
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
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Rank: 4/10',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff915587),
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
                width: MediaQuery.of(context).size.width * 0.4 + 60,
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Timer: 00:00',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff887e01),
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
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Game 1/15',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff3f6182),
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
    final Paint paint = Paint()..color = const Color(0xffd9b8d9);

    final Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width - 10, size.height)
      ..relativeQuadraticBezierTo(10, 0, 0, -10)
      ..relativeLineTo(-60, -size.height + 10)
      ..close();
    canvas.drawShadow(path, Colors.black, 7.5, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Timer bar
class TimerBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = const Color(0xfff6f025);

    final Path path = Path()
      ..relativeLineTo(50, size.height - 10)
      ..relativeQuadraticBezierTo(10, 10, 20, 10)
      ..lineTo(size.width * 0.8 - 10, size.height)
      ..relativeQuadraticBezierTo(10, 0, 20, -10)
      ..relativeLineTo(60, -size.height + 10)
      ..close();

    canvas.drawShadow(path, Colors.black, 7.5, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Game bar
class GameBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = const Color(0xff88b8e2);

    final Path path = Path()
      ..moveTo(60, 0)
      ..lineTo(10, size.height - 10)
      ..relativeQuadraticBezierTo(-10, 10, 10, 10)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawShadow(path, Colors.black, 7.5, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
