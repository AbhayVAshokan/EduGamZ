// Circle all the correct answers

import 'package:flutter/material.dart';

import '../widgets/game/top_bar.dart';
import '../widgets/game/bottom_bar.dart';
import '../widgets/game/question.dart';

class GameCircleAnswer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final MediaQueryData mediaQuery = MediaQuery.of(context);
    final String question =
        'Select all the things you need to go to a supermarket.';

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                TopBar(),
                const SizedBox(height: 20.0),
                Question(question: question),
                const SizedBox(height: 20.0),
              ],
            ),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
