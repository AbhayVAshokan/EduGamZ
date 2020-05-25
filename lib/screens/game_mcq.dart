import 'dart:async';

import 'package:flutter/material.dart';

import '../models/game/mcq.dart';
import '../widgets/game/top_bar.dart';
import '../widgets/game/question.dart';
import '../resources/realtime_data.dart';
import '../widgets/game/bottom_bar.dart';
import '../screens/game_more_than_one.dart';

class GameMCQ extends StatefulWidget {
  final MCQ question;
  GameMCQ({this.question});

  @override
  _GameMCQState createState() => _GameMCQState();
}

class _GameMCQState extends State<GameMCQ> with TickerProviderStateMixin {
  int correctOption = 0;
  List<Animation> animation = [];
  List<AnimationController> animationController = [];

  @override
  initState() {
    super.initState();

    for (int i = 0; i < widget.question.options.length; i++) {
      animationController.add(
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 250),
        ),
      );

      if (widget.question.options[i].compareTo(widget.question.correctAnswer) ==
          0) {
        animation.add(
          ColorTween(begin: Colors.white, end: Colors.green)
              .animate(animationController[i]),
        );
        correctOption = i;
      } else
        animation.add(
          ColorTween(begin: Colors.white, end: Colors.red)
              .animate(animationController[i]),
        );
    }
  }

  Widget mcqOption({
    @required String option,
    @required AnimationController animationController,
    @required AnimationController correctAnimationController,
    @required Animation animation,
  }) {
    return AnimatedBuilder(
      animation: animation,
      builder: (ctx, child) => GestureDetector(
        onTap: () {
          Timer(
            const Duration(seconds: 1),
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    GameMoreThanOne(question: moreThanOneCorrect[0]),
              ),
            ),
          );
          animationController.forward();
          correctAnimationController.forward();
        },
        child: Container(
          width: 120,
          height: 120,
          margin: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 5.0,
          ),
          decoration: BoxDecoration(
            color: animation.value,
            border: Border.all(),
            borderRadius: BorderRadius.circular(30.0),
          ),
          alignment: Alignment.center,
          child: Text(
            option,
            style: const TextStyle(
              fontSize: 18.0,
            ),
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
                                option: widget.question.options[i],
                                animation: animation[i],
                                animationController: animationController[i],
                                correctAnimationController:
                                    animationController[correctOption],
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
