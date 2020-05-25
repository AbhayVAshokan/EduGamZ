import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/game/top_bar.dart';
import '../widgets/game/question.dart';
import '../widgets/game/bottom_bar.dart';
import '../models/game/more_than_one_correct.dart';

class GameMoreThanOne extends StatefulWidget {
  final MoreThanOneCorrect question;
  GameMoreThanOne({@required this.question});

  @override
  _GameMoreThanOneState createState() => _GameMoreThanOneState();
}

class _GameMoreThanOneState extends State<GameMoreThanOne>
    with TickerProviderStateMixin {
  List<AnimationController> animationController = [];
  List<Animation> animation = [];
  List<bool> isSelected = [];

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

      animation.add(ColorTween(begin: Colors.white, end: Colors.yellow)
          .animate(animationController[i]));

      isSelected.add(false);
    }
  }

  Widget moreThanOneOption({
    @required int index,
    @required Animation animation,
    @required Map<String, dynamic> option,
    @required AnimationController animationController,
  }) {
    return AnimatedBuilder(
      animation: animation,
      builder: (ctx, child) => GestureDetector(
        onTap: () {
          if (animation.value == Colors.white) {
            animationController.forward();
            isSelected[index] = true;
          } else {
            animationController.reverse();
            isSelected[index] = true;
          }
        },
        child: Container(
          width: 100.0,
          height: 95,
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
          child: Column(
            children: [
              Expanded(
                child: Image.asset(option['image']),
              ),
              Text(
                option['text'],
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
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
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0;
                                  i < widget.question.options.length;
                                  i++)
                                moreThanOneOption(
                                  index: i,
                                  animation: animation[i],
                                  option: widget.question.options[i],
                                  animationController: animationController[i],
                                ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Timer(
                              const Duration(seconds: 1),
                              () => Navigator.pushReplacementNamed(
                                  context, '/gameFillContainer'),
                            );
                            setState(() {
                              for (int i = 0;
                                  i < widget.question.options.length;
                                  i++) {
                                if (isSelected[i]) {
                                  if (widget.question.options[i]['correct'] ==
                                      true) {
                                    animation[i] = ColorTween(
                                            begin: Colors.yellow,
                                            end: Colors.green)
                                        .animate(animationController[i]);
                                    animationController[i].forward();
                                  } else {
                                    animation[i] = ColorTween(
                                            begin: Colors.yellow,
                                            end: Colors.red)
                                        .animate(animationController[i]);
                                    animationController[i].forward();
                                  }
                                }
                              }
                            });
                          },
                          child: Container(
                            alignment: Alignment.bottomRight,
                            width: MediaQuery.of(context).size.width * 0.75,
                            padding: EdgeInsets.only(
                              top: 10,
                              bottom: 50.0,
                              right: 10.0,
                            ),
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).primaryColor,
                              ),
                              child: Icon(
                                Icons.check,
                                size: 30.0,
                                color: Colors.white,
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
      ),
    );
  }
}
