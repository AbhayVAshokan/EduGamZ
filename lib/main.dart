import 'package:edugamz/screens/flip_phone_alert.dart';
import 'package:edugamz/screens/setup_screens.dart';
import 'package:edugamz/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'package:edugamz/resources/screen_transitions.dart';

void main() {
  runApp(EduGamZ());
}

class EduGamZ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduGamZ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff2fc4b2),
      ),
      initialRoute: '/welcome',
      onGenerateRoute: (settings) {
        var screen;
        switch (settings.name) {
          case '/welcome':
            screen = fadeTransition(screen: WelcomeScreen());
            break;
          default:
        }
        return screen;
      },
    );
  }
}
