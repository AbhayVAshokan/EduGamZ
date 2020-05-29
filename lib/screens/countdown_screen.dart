// Loading screen: A placeholder screen when the HTTP requests are occuring in the background.

import 'dart:async';

import 'package:flutter/material.dart';

import '../resources/realtime_data.dart';
import '../resources/screen_transitions.dart';
import '../resources/game__screen_sequence.dart';

class CountdownScreen extends StatefulWidget {
  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountdownScreen> {
  double _opacity2 = 1.0, _opacity3 = 1.0;

  @override
  void initState() {
    Timer(
      const Duration(
        seconds: 3,
      ),
      () => Navigator.pushReplacement(
        context,
        fadeTransition(
          screen: gameScreen[gameNumber++],
        ),
      ),
    );

    Timer(const Duration(seconds: 1), () {
      setState(() {
        _opacity3 = 0;
      });
    });

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _opacity2 = 0;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Starting in...',
                style: const TextStyle(fontSize: 22.0),
              ),
              SizedBox(height: mediaQuery.size.height * 0.05),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: mediaQuery.size.height * 0.4,
                    height: mediaQuery.size.height * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.yellow.withOpacity(0.75),
                      shape: BoxShape.circle,
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: const Text(
                        '1',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 75.0,
                        ),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(microseconds: 0),
                    opacity: _opacity2,
                    child: Container(
                      width: mediaQuery.size.height * 0.4,
                      height: mediaQuery.size.height * 0.4,
                      margin: const EdgeInsets.only(top: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.yellow[400],
                        shape: BoxShape.circle,
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: const Text(
                          '2',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 75.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(microseconds: 0),
                    opacity: _opacity3,
                    child: Container(
                      width: mediaQuery.size.height * 0.4,
                      height: mediaQuery.size.height * 0.4,
                      margin: const EdgeInsets.only(bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.yellow[400],
                        shape: BoxShape.circle,
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: const Text(
                          '3',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 75.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
