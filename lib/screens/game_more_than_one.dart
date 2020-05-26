import 'package:edugamz/screens/answer_animation.dart';
import 'package:edugamz/screens/game_fill_container.dart';
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

class _GameMoreThanOneState extends State<GameMoreThanOne> {
  int chances = 2;
  List<Color> _borderColor = [];
  List<bool> _selected = [];

  @override
  initState() {
    super.initState();

    for (int i = 0; i < widget.question.options.length; i++) {
      _borderColor.add(Colors.black);
      _selected.add(false);
    }
  }

  Widget moreThanOneOption({
    @required int index,
    @required MediaQueryData mediaQuery,
    @required Map<String, dynamic> option,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected[index] = !_selected[index];
          _borderColor[index] = _selected[index] ? Colors.amber : Colors.black;
        });
      },
      child: Container(
        width: mediaQuery.size.width * 0.14,
        height: mediaQuery.size.height * 0.25,
        margin: EdgeInsets.symmetric(
          horizontal: mediaQuery.size.width * 0.01,
          vertical: 5.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: _borderColor[index],
            width: 1.5,
          ),
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
                                  mediaQuery: mediaQuery,
                                  option: widget.question.options[i],
                                ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          width: MediaQuery.of(context).size.width * 0.75,
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 50.0,
                            right: 10.0,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                bool correctAnswer = true;

                                chances -= 1;

                                for (int i = 0;
                                    i < widget.question.options.length;
                                    i++) {
                                  if ((_selected[i] &&
                                          !widget.question.options[i]
                                              ['correct']) ||
                                      (!_selected[i] &&
                                          widget.question.options[i]
                                              ['correct']))
                                    correctAnswer = false;

                                  if (_selected[i]) {
                                    if (widget.question.options[i]['correct'])
                                      _borderColor[i] = Colors.green;
                                    else
                                      _borderColor[i] = Colors.red;
                                  }

                                  _borderColor[i] = Colors.black;
                                }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AnswerAnimation(
                                      correct: correctAnswer,
                                      nextScreen:
                                          (correctAnswer || chances <= 0)
                                              ? GameFillContainer()
                                              : null,
                                    ),
                                  ),
                                );
                              });
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
