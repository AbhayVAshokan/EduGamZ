// Circle all the correct answers

import 'package:edugamz/resources/dummy_data.dart';
import 'package:edugamz/screens/game_match_the_following_text.dart';
import 'package:flutter/material.dart';

import '../widgets/game/top_bar.dart';
import '../widgets/game/question.dart';
import '../widgets/game/bottom_bar.dart';
import '../models/game/more_than_one_correct.dart';

class GameCircleAnswer extends StatelessWidget {
  final MoreThanOneCorrect question;
  GameCircleAnswer({@required this.question});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameMatchTheFollowingText(
                    question: dummyMatchTheFollowingQuestions[0],
                  ),
                ),
              ),
              child: Column(
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
                              builder: (context, constraints) => Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  for (int i = 0;
                                      i < question.options.length;
                                      i++)
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: (constraints.maxWidth -
                                                constraints.maxHeight * 1.5) /
                                            6,
                                      ),
                                      height:
                                          constraints.maxHeight / 2 - (20) / 2,
                                      width: constraints.maxHeight / 2,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            question.options[i]['image'],
                                          ),
                                        ),
                                      ),
                                    )
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
            ),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
