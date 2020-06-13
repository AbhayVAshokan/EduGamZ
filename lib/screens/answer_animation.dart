// Animated check-mark or wrong-cross screen after a question is answered.

import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/game/top_bar.dart';
import '../widgets/game/bottom_bar.dart';
import '../resources/realtime_data.dart';
import '../resources/screen_transitions.dart';

class AnswerAnimation extends StatefulWidget {
  final bool correct;
  final Widget nextScreen;

  AnswerAnimation({
    @required this.correct,
    this.nextScreen,
  });

  @override
  _AnswerAnimationState createState() => _AnswerAnimationState();
}

class _AnswerAnimationState extends State<AnswerAnimation> {
  double _opacity1 = 1,
      _opacity2 = 1,
      _opacity3 = 0,
      _opacity4 = 0,
      _opacity5 = 0,
      _opacity6 = 1,
      _opacity7 = 0,
      _opacity8 = 1,
      _opacity9 = 0,
      _opacity10 = 0,
      _opacity11 = 0,
      _opacity12 = 0;

  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        if (!widget.correct) {
          gameNumber -= 1;
          Navigator.pop(context);
        } else
          Navigator.pushAndRemoveUntil(
            context,
            fadeTransition(
              screen: widget.nextScreen,
            ),
            (route) => route.isFirst,
          );
      },
    );

    Timer(const Duration(seconds: 1), () {
      setState(() {
        _opacity3 = _opacity4 = _opacity5 = _opacity7 = 1;
      });
    });

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _opacity9 = _opacity10 = _opacity11 = _opacity12 = 1;
        _opacity1 = _opacity4 = _opacity8 = _opacity5 = 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: mediaQuery.size.height,
          width: mediaQuery.size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  TopBar(
                    gameNumber: gameNumber - 1,
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.025),
                  Expanded(
                    child: SizedBox(
                      width: mediaQuery.size.width,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: mediaQuery.size.height * 0.4,
                            height: mediaQuery.size.height * 0.4,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  widget.correct
                                      ? 'assets/images/game/correct.png'
                                      : 'assets/images/game/wrong.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            left: mediaQuery.size.width * 0.15,
                            bottom: mediaQuery.size.height * 0.3,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 250),
                              opacity: _opacity1,
                              child: CircleAvatar(
                                radius: mediaQuery.size.height * 0.035,
                                backgroundColor: const Color(0xffcfb3d0),
                              ),
                            ),
                          ),
                          Positioned(
                            left: mediaQuery.size.width * 0.1,
                            bottom: mediaQuery.size.height * 0.6,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 250),
                              opacity: _opacity2,
                              child: CircleAvatar(
                                radius: mediaQuery.size.height * 0.02,
                                backgroundColor: const Color(0xffcfb3d0),
                              ),
                            ),
                          ),
                          Positioned(
                            left: mediaQuery.size.width * 0.3,
                            bottom: mediaQuery.size.height * 0.1,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 250),
                              opacity: _opacity3,
                              child: CircleAvatar(
                                radius: mediaQuery.size.height * 0.035,
                                backgroundColor: const Color(0xffcfb3d0),
                              ),
                            ),
                          ),
                          Positioned(
                            left: mediaQuery.size.width * 0.3 - 10,
                            bottom: mediaQuery.size.height * 0.4,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 250),
                              opacity: _opacity4,
                              child: CircleAvatar(
                                radius: mediaQuery.size.height * 0.015,
                                backgroundColor: const Color(0xffcfb3d0),
                              ),
                            ),
                          ),
                          Positioned(
                            right: mediaQuery.size.width * 0.2,
                            bottom: mediaQuery.size.height * 0.35,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 250),
                              opacity: _opacity5,
                              child: CircleAvatar(
                                radius: mediaQuery.size.height * 0.035,
                                backgroundColor: const Color(0xfffad85b),
                              ),
                            ),
                          ),
                          Positioned(
                            right: mediaQuery.size.width * 0.05,
                            bottom: mediaQuery.size.height * 0.4,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 250),
                              opacity: _opacity6,
                              child: CircleAvatar(
                                radius: mediaQuery.size.height * 0.02,
                                backgroundColor: const Color(0xfffad85b),
                              ),
                            ),
                          ),
                          Positioned(
                            right: mediaQuery.size.width * 0.3,
                            bottom: mediaQuery.size.height * 0.1,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 250),
                              opacity: _opacity7,
                              child: CircleAvatar(
                                radius: mediaQuery.size.height * 0.035,
                                backgroundColor: const Color(0xfffad85b),
                              ),
                            ),
                          ),
                          Positioned(
                            right: mediaQuery.size.width * 0.3 - 10,
                            bottom: mediaQuery.size.height * 0.7,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 250),
                              opacity: _opacity8,
                              child: CircleAvatar(
                                radius: mediaQuery.size.height * 0.015,
                                backgroundColor: const Color(0xfffad85b),
                              ),
                            ),
                          ),
                          Positioned(
                            left: mediaQuery.size.width * 0.3,
                            bottom: mediaQuery.size.height * 0.6,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 250),
                              opacity: _opacity9,
                              child: CircleAvatar(
                                radius: mediaQuery.size.height * 0.035,
                                backgroundColor: const Color(0xffcfb3d0),
                              ),
                            ),
                          ),
                          Positioned(
                            left: mediaQuery.size.width * 0.25,
                            bottom: mediaQuery.size.height * 0.42,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 250),
                              opacity: _opacity10,
                              child: CircleAvatar(
                                radius: mediaQuery.size.height * 0.02,
                                backgroundColor: const Color(0xffcfb3d0),
                              ),
                            ),
                          ),
                          Positioned(
                            right: mediaQuery.size.width * 0.35,
                            bottom: mediaQuery.size.height * 0.62,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 250),
                              opacity: _opacity11,
                              child: CircleAvatar(
                                radius: mediaQuery.size.height * 0.035,
                                backgroundColor: const Color(0xfffad85b),
                              ),
                            ),
                          ),
                          Positioned(
                            right: mediaQuery.size.width * 0.1,
                            bottom: mediaQuery.size.height * 0.3,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 250),
                              opacity: _opacity12,
                              child: CircleAvatar(
                                radius: mediaQuery.size.height * 0.02,
                                backgroundColor: const Color(0xfffad85b),
                              ),
                            ),
                          ),
                        ],
                      ),
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
