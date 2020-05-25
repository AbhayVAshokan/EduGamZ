// File to configure default theme, font and routes.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/game_mcq.dart';
import './screens/pick_level.dart';
import './screens/pick_theme.dart';
import './screens/login_screen.dart';
import './screens/splash_screen.dart';
import './screens/loading_screen.dart';
import './screens/welcome_screen.dart';
import './screens/category_screen.dart';
import './screens/game_circle_answer.dart';
import './screens/game_fill_container.dart';
import './resources/screen_transitions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
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
      initialRoute: '/splash',
      onGenerateRoute: (settings) {
        var screen;
        switch (settings.name) {
          case '/splash':
            screen = fadeTransition(
              screen: SplashScreen(),
            );
            break;
          case '/login':
            screen = fadeTransition(
              screen: LoginScreen(),
            );
            break;
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
              screen: LoadingScreen(),
            );
            break;

          case '/gameMCQ':
            screen = fadeTransition(
              screen: GameMCQ(),
            );
            break;
          case '/gameFillContainer':
            screen = fadeTransition(
              screen: GameFillContainer(),
            );
            break;
          case '/gameCircleAnswer':
            screen = fadeTransition(
              screen: GameCircleAnswer(),
            );
            break;

          default:
        }
        return screen;
      },
    );
  }
}
