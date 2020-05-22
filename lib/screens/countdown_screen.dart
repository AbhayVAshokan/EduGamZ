import 'dart:async';

import 'package:edugamz/resources/realtime_data.dart';
import 'package:edugamz/screens/game_mcq.dart';
import 'package:flutter/material.dart';

class CountDownScreen extends StatefulWidget {
  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDownScreen> {
  @override
  void initState() {
    Timer(
      const Duration(
        seconds: 2,
        milliseconds: 500,
      ),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => GameMCQ(
            question: mcqQuestions[0],
          ),
        ),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffc3e7dd),
                    Colors.white,
                    Colors.white,
                    Color(0xffc3e7dd),
                  ],
                ),
              ),
            ),
            Image.asset(
              'assets/images/hourglass.gif',
              width: mediaQuery.size.width * 0.3,
              height: mediaQuery.size.width * 0.3,
            ),
          ],
        ),
      ),
    );
  }
}
