import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color _fadeColor = Colors.black;

  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, '/welcome'),
    );
    super.initState();

    Timer(const Duration(microseconds: 1), () {
      setState(() {
        _fadeColor = Color(0x00000000);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: mediaQuery.size.width,
          height: mediaQuery.size.height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xffc3e7dd),
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                const Color(0xffc3e7dd),
              ],
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: mediaQuery.size.height,
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/splash_screen_foreground.png',
                  height: mediaQuery.size.height * 0.75,
                  fit: BoxFit.contain,
                ),
              ),
              const Text(
                'EduGamZ',
                style: TextStyle(
                  fontFamily: 'KaushanScript',
                  fontSize: 75.0,
                  color: const Color(0xff3090BD),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                color: _fadeColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
