// Circle all the correct answers

import 'package:flutter/material.dart';

import '../answer_animation.dart';
import '../../widgets/game/top_bar.dart';
import '../../widgets/game/question.dart';
import '../../widgets/game/bottom_bar.dart';
import '../../resources/realtime_data.dart';
import '../../resources/screen_transitions.dart';
import '../../resources/game__screen_sequence.dart';
import '../../models/game/more_than_one_correct.dart';

class CircleAnswer extends StatefulWidget {
  final MoreThanOneCorrect question;
  CircleAnswer({@required this.question});

  @override
  _CircleAnswerState createState() => _CircleAnswerState();
}

class _CircleAnswerState extends State<CircleAnswer> {
  List<Color> _colors = [];
  List<bool> _selected = [];
  int chances = 2;

  @override
  void initState() {
    for (int i = 0; i < widget.question.options.length; i++) {
      _colors.add(Colors.white);
      _selected.add(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TopBar(),
                const SizedBox(height: 20.0),
                Question(question: widget.question.question),
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
                                    i < widget.question.options.length;
                                    i++)
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _colors[i] = _selected[i]
                                            ? Colors.white
                                            : Colors.yellow;

                                        _selected[i] = !_selected[i];
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 250),
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
                                            widget.question.options[i]['image'],
                                          ),
                                        ),
                                        gradient: RadialGradient(
                                          colors: [
                                            _colors[i],
                                            Colors.white,
                                          ],
                                          radius: 0.6,
                                          tileMode: TileMode.repeated,
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
            Positioned(
              bottom: mediaQuery.size.height * 0.05,
              right: mediaQuery.size.width * 0.1,
              child: GestureDetector(
                onTap: () {
                  bool correct = true;

                  for (int i = 0; i < widget.question.options.length; i++) {
                    if (widget.question.options[i]['correct'] != _selected[i])
                      correct = false;
                  }
                  Navigator.push(
                    context,
                    fadeTransition(
                      screen: AnswerAnimation(
                        correct: correct,
                        nextScreen: gameScreen[gameNumber++],
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Icon(
                    Icons.check,
                    size: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
