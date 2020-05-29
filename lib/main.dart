// File to configure default theme, font and routes.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/pick_level.dart';
import './screens/pick_theme.dart';
import './screens/splash_screen.dart';
import './screens/welcome_screen.dart';
import './screens/category_screen.dart';
import './screens/countdown_screen.dart';
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
          case '/welcome':
            screen = fadeTransition(
              screen: WelcomeScreen(),
            );
            break;
          case '/countdown':
            screen = fadeTransition(
              screen: CountdownScreen(),
            );
            break;
        }
        return screen;
      },
    );
  }
}
