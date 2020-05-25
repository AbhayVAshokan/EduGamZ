// Bottom bar in the quiz screens containning Close and Coin buttons

import 'dart:math';

import 'package:flutter/material.dart';

import '../game/show_leaderboard.dart';

class BottomBar extends StatelessWidget {
  final bool resultScreen;
  BottomBar({this.resultScreen});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Positioned(
      bottom: 0.0,
      child: SizedBox(
        height: mediaQuery.size.height * 0.15,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: FittedBox(
                child: CustomPaint(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 5.0,
                      bottom: 5.0,
                    ),
                    child: Image.asset(
                      'assets/images/quiz/quit.png',
                      fit: BoxFit.contain,
                      width: mediaQuery.size.height * 0.15,
                    ),
                  ),
                  painter: CloseButton(),
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.15,
              child: GestureDetector(
                onVerticalDragEnd: (details) {
                  if (details.primaryVelocity < -200)
                    showLeaderBoard(
                      context: context,
                    );
                },
                child: CustomPaint(
                  child: Container(
                    alignment: Alignment.topCenter,
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
              ),
            ),
            FittedBox(
              child: CustomPaint(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 5.0,
                    bottom: 5.0,
                  ),
                  child: Image.asset(
                    'assets/images/quiz/coin.png',
                    fit: BoxFit.contain,
                    width: mediaQuery.size.height * 0.15,
                  ),
                ),
                painter: CoinButton(),
              ),
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
    Offset center = Offset(size.width * 0.25, size.height * 0.75);
    canvas.drawCircle(center, 80.0, paint);

    paint = Paint()..color = const Color(0xff73cbc2);
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
    Offset center = Offset(size.width * 0.75, size.height * 0.75);
    canvas.drawCircle(center, 80.0, paint);

    paint = Paint()..color = const Color(0xff73cbc2);
    canvas.drawCircle(center, 65.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Chat drawer custom paint
class BottomDrawer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xffb9e2df);
    Offset center = Offset(size.width / 2, size.height * 3.5);
    canvas.drawCircle(center, size.height * 3, paint);

    paint.color = const Color(0xff59b8b5);
    center = Offset(size.width / 2, size.height * 0.75);
    canvas.drawCircle(center, 7.5, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
