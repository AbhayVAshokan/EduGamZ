// Bottom bar in the quiz screens containning Close and Coin buttons

import 'dart:math';

import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: CustomPaint(
                child: Container(
                  height: 80.0,
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.bottomLeft,
                  child: Image.asset(
                    'assets/images/quit.png',
                    width: 45.0,
                    fit: BoxFit.contain,
                  ),
                ),
                painter: CloseButton(),
              ),
            ),
            CustomPaint(
              child: Container(
                height: 75.0,
                alignment: Alignment.center,
                child: Transform.rotate(
                  angle: -pi / 2,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 25.0,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              painter: BottomDrawer(),
            ),
            CustomPaint(
              child: Container(
                height: 80.0,
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/images/coin.png',
                  width: 55.0,
                  fit: BoxFit.contain,
                ),
              ),
              painter: CoinButton(),
            ),
          ],
        ),
      ),
    );
  }
}

// Close button custom paint
class CloseButton extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xffa1e3db);
    Offset center = Offset(0, size.height);
    canvas.drawCircle(center, 80.0, paint);

    paint = Paint()..color = const Color(0xff73cbc2);
    center = Offset(0, size.height);
    canvas.drawCircle(center, 65.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Coins custom paint
class CoinButton extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xff9fe3dc);
    Offset center = Offset(size.width, size.height);
    canvas.drawCircle(center, 80.0, paint);

    paint = Paint()..color = const Color(0xff73cbc2);
    center = Offset(size.width, size.height);
    canvas.drawCircle(center, 65.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Bottom drawer custom paint
class BottomDrawer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xffb9e2df);
    Offset center = Offset(size.width / 2, 200);
    canvas.drawCircle(center, 150, paint);

    paint.color = const Color(0xff59b8b5);
    center = Offset(size.width / 2, 62.0);
    canvas.drawCircle(center, 10.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
