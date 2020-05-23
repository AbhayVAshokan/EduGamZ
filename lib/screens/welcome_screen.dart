// Welcoming the user into the game by a mouse: Miss Mouse

import 'dart:async';

import 'package:flutter/material.dart';

import '../services/api_calls.dart';
import '../screens/flip_phone_alert.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    // API requests
    getThemes();
    getQuestions();

    if (isLandscape) {
      Timer(
        const Duration(seconds: 3),
        () {
          Navigator.pushReplacementNamed(context, '/level');
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        body: isLandscape
            ? Center(
                child: Container(
                  height: mediaQuery.size.height * 0.8,
                  width: mediaQuery.size.height * 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.yellow,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Hey!\nWelcome aboard!\nI am Miss Mouse',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        height: mediaQuery.size.height * 0.45,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            fit: BoxFit.contain,
                            image: const AssetImage(
                              'assets/images/miss_mouse.png',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : FlipPhoneAlert(),
      ),
    );
  }
}
