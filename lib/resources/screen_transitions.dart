// Different types of screen transition animations.

import 'package:flutter/material.dart';

// Screen fade transition.
Route fadeTransition({@required Widget screen}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
      opacity: Tween(
        begin: 0.0,
        end: 1.0,
      ).animate(animation),
      child: screen,
    ),
    transitionDuration: const Duration(milliseconds: 500),
  );
}
