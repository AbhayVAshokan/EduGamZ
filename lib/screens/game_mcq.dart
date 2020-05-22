import 'dart:async';

import 'package:edugamz/models/game/mcq.dart';
import 'package:edugamz/resources/realtime_data.dart';
import 'package:edugamz/screens/flip_phone_alert.dart';
import 'package:edugamz/widgets/game/bottom_bar.dart';
import 'package:edugamz/widgets/game/question.dart';
import 'package:edugamz/widgets/game/top_bar.dart';
import 'package:flutter/material.dart';

class GameMCQ extends StatefulWidget {
  final MCQ question;
  GameMCQ({this.question});

  @override
  _GameMCQState createState() => _GameMCQState();
}

class _GameMCQState extends State<GameMCQ> with TickerProviderStateMixin {
  AnimationController _correctAnimationController;
  AnimationController _wrongAnimationController;
  Animation _wrongAnimation;
  Animation _correctAnimation;

  @override
  initState() {
    super.initState();

    _correctAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _wrongAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _correctAnimation = ColorTween(begin: Colors.white, end: Colors.green)
        .animate(_correctAnimationController);
    _wrongAnimation = ColorTween(begin: Colors.white, end: Colors.red)
        .animate(_wrongAnimationController);
  }

  Widget mcqOption({@required String option}) {
    return AnimatedBuilder(
      animation: option.compareTo(widget.question.correctAnswer) == 0
          ? _correctAnimation
          : _wrongAnimation,
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
          _correctAnimationController.forward();
          _wrongAnimationController.forward();
        },
        child: Container(
          width: 120,
          height: 120,
          margin: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 5.0,
          ),
          decoration: BoxDecoration(
            color: option.compareTo(widget.question.correctAnswer) == 0
                ? _correctAnimation.value
                : _wrongAnimation.value,
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
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    return isLandscape
        ? SafeArea(
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
                                children: widget.question.options
                                    .map(
                                      (option) => mcqOption(option: option),
                                    )
                                    .toList(),
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
          )
        : FlipPhoneAlert();
  }
}
