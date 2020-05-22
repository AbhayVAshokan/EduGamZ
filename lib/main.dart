import 'package:edugamz/screens/category_screen.dart';
import 'package:edugamz/screens/countdown_screen.dart';
import 'package:edugamz/screens/game_mcq.dart';
import 'package:edugamz/screens/game_results.dart';
import 'package:edugamz/screens/pick_level.dart';
import 'package:edugamz/screens/pick_theme.dart';
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
        fontFamily: 'Lato',
      ),
      initialRoute: '/welcome',
      onGenerateRoute: (settings) {
        var screen;
        switch (settings.name) {
          case '/welcome':
            screen = fadeTransition(
              screen: WelcomeScreen(),
            );
            break;
          case '/level':
            screen = fadeTransition(
              screen: PickLevel(),
            );
            break;
          case '/category':
            screen = fadeTransition(
              screen: CategoryScreen(),
            );
            break;
          case '/theme':
            screen = fadeTransition(
              screen: PickTheme(),
            );
            break;
          case '/countdown':
            screen = fadeTransition(
              screen: CountDownScreen(),
            );
            break;
          case '/gameResults':
            screen = fadeTransition(
              screen: GameResults(),
            );
            break;
          case '/gameMCQ':
            screen = fadeTransition(
              screen: GameMCQ(),
            );
            break;
          default:
        }
        return screen;
      },
    );
  }
}
