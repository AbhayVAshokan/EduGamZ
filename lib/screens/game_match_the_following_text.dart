// Circle all the correct answers

import 'package:flutter/material.dart';

import '../widgets/game/top_bar.dart';
import '../widgets/game/question.dart';
import '../widgets/game/bottom_bar.dart';
import '../models/game/match_the_following.dart';

class GameMatchTheFollowingText extends StatelessWidget {
  final MatchTheFollowing question;
  GameMatchTheFollowingText({@required this.question});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TopBar(),
                const SizedBox(height: 20.0),
                Question(question: question.question),
                const SizedBox(height: 20.0),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: mediaQuery.size.width * 0.75,
                          padding: EdgeInsets.only(
                            bottom: mediaQuery.size.height * 0.07,
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraints) => Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    for (int i = 0;
                                        i < question.images.length;
                                        i++)
                                      Expanded(
                                        child: Container(
                                          color: Colors.amber,
                                        ),
                                      ),
                                  ],
                                ),
                                Row(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
