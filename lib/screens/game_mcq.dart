import 'dart:async';

import 'package:edugamz/screens/answer_animation.dart';
import 'package:flutter/material.dart';

import '../models/game/mcq.dart';
import '../resources/dummy_data.dart';
import '../widgets/game/top_bar.dart';
import '../widgets/game/question.dart';
import '../widgets/game/bottom_bar.dart';
import '../screens/game_more_than_one.dart';

class GameMCQ extends StatefulWidget {
  final MCQ question = dummyMcqQuestions[0];

  @override
  _GameMCQState createState() => _GameMCQState();
}

class _GameMCQState extends State<GameMCQ> with TickerProviderStateMixin {
  int chances = 2;
  List<Color> borderColor = [];

  @override
  initState() {
    for (int i = 0; i < widget.question.options.length; i++)
      borderColor.add(Colors.black);

    super.initState();
  }

  Widget mcqOption({
    @required int index,
    @required MediaQueryData mediaQuery,
  }) {
    return GestureDetector(
      onTap: () {
        final bool correct = widget.question.options[index]
                .compareTo(widget.question.correctAnswer) ==
            0;

        setState(() {
          for (int i = 0; i < widget.question.options.length; i++)
            borderColor[i] = Colors.deepPurple[900];
          borderColor[index] = correct ? Colors.green : Colors.red;
          chances--;
        });

        Timer(
          const Duration(milliseconds: 250),
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnswerAnimation(
                correct: correct,
                nextScreen: (correct || chances <= 0)
                    ? GameMoreThanOne(question: dummyMoreThanOneCorrect[0])
                    : null,
              ),
            ),
          ),
        );

        Timer(const Duration(milliseconds: 501), () {
          setState(() {
            for (int i = 0; i < widget.question.options.length; i++)
              borderColor[i] = Colors.black;
          });
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: mediaQuery.size.height * 0.3,
        height: mediaQuery.size.height * 0.3,
        margin: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: borderColor[index],
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.question.options[index],
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: mediaQuery.size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  TopBar(),
                  SizedBox(height: mediaQuery.size.height * 0.025),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20.0),
                        Question(question: widget.question.question),
                        const SizedBox(height: 20.0),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            for (int i = 0;
                                i < widget.question.options.length;
                                i++)
                              mcqOption(
                                index: i,
                                mediaQuery: mediaQuery,
                              ),
                          ],
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
      ),
    );
  }
}
