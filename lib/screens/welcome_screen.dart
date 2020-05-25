// Welcoming the user into the game by a mouse: Miss Mouse

import 'dart:async';

import 'package:flutter/material.dart';

import '../services/api_calls.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    // API requests
    getThemes();
    getQuestions();

    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, '/level');
      },
    );

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            height: mediaQuery.size.height * 0.8,
            width: mediaQuery.size.height * 1.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: const Color(0xfff6f025),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 35.0),
                Text(
                  'Hey!\nWelcome aboard!\nI am Miss Mouse',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: mediaQuery.size.height > 300 ? 22 : 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15.0),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.contain,
                        image: const AssetImage(
                          'assets/images/miss_mouse.png',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
