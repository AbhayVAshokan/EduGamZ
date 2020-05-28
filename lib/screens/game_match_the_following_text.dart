// Circle all the correct answers

import 'package:flutter/material.dart';

import './game_audio.dart';
import './answer_animation.dart';
import '../widgets/game/top_bar.dart';
import '../resources/dummy_data.dart';
import '../widgets/game/question.dart';
import '../widgets/game/bottom_bar.dart';
import '../models/game/match_the_following.dart';
import '../widgets/game/match_the_following_text/matching_painter.dart';

class GameMatchTheFollowingText extends StatefulWidget {
  final MatchTheFollowing question;

  GameMatchTheFollowingText({
    @required this.question,
  });

  @override
  _GameMatchTheFollowingTextState createState() =>
      _GameMatchTheFollowingTextState();
}

class _GameMatchTheFollowingTextState extends State<GameMatchTheFollowingText> {
  List<GlobalKey> _textKey = [];
  List<GlobalKey> _imageKey = [];
  final GlobalKey _canvasKey = GlobalKey();

  List<Offset> points = [];
  List<Map<String, int>> completed = [];
  List<List<Offset>> permanentLines = [];

  Offset panEndPosition;

  double _textWidth;
  double _textHeight;
  double _imageWidth;
  double _imageHeight;

  int firstValue;
  Offset sourcePoint;
  Offset destinationPoint;

  @override
  void initState() {
    for (int i = 0; i < widget.question.texts.length; i++) {
      _textKey.add(GlobalKey());
      _imageKey.add(GlobalKey());
      permanentLines.add([]);
      completed.add(null);
    }
    super.initState();
  }

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
                Question(question: widget.question.question),
                const SizedBox(height: 20.0),
                Expanded(
                  child: Container(
                    width: mediaQuery.size.width * 0.75,
                    padding: EdgeInsets.only(
                      bottom: mediaQuery.size.height * 0.1,
                    ),
                    child: LayoutBuilder(builder: (context, constraints) {
                      _textWidth = constraints.maxHeight /
                          (2 * widget.question.texts.length) *
                          5;
                      _textHeight = constraints.maxHeight /
                          (2 * widget.question.texts.length);
                      _imageHeight = _imageWidth = constraints.maxHeight * 0.5;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (int i = 0;
                                  i < widget.question.images.length;
                                  i++)
                                Container(
                                  height: _imageHeight,
                                  width: _imageWidth,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: (constraints.maxWidth -
                                            _imageWidth *
                                                widget.question.images.length) /
                                        (2 * widget.question.images.length),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: FittedBox(
                                    key: _imageKey[i],
                                    child: Image.asset(
                                      widget.question.images[i]['image'],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (int i = 0;
                                  i < widget.question.texts.length;
                                  i++)
                                Container(
                                  height: _textHeight,
                                  width: _textWidth,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  margin: EdgeInsets.symmetric(
                                    horizontal: (constraints.maxWidth -
                                            _textWidth *
                                                widget.question.texts.length) /
                                        (widget.question.texts.length * 2),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: FittedBox(
                                    key: _textKey[i],
                                    child: Text(
                                      widget.question.texts[i],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
            SizedBox(
              key: _canvasKey,
              height: mediaQuery.size.height,
              width: mediaQuery.size.width,
              child: GestureDetector(
                onPanStart: (DragStartDetails details) {
                  points = [];
                  sourcePoint = destinationPoint = null;

                  final Offset panStartPosition = details.localPosition;

                  for (int i = 0; i < widget.question.texts.length; i++) {
                    final RenderBox renderBox =
                        _textKey[i].currentContext.findRenderObject();
                    final Offset _textPosition =
                        renderBox.localToGlobal(Offset.zero);

                    final bool leftBound =
                        panStartPosition.dx >= _textPosition.dx - 5;
                    final bool rightBound = panStartPosition.dx <=
                        _textPosition.dx + _textWidth + 5;
                    final bool bottomBound = panStartPosition.dy >=
                        _textPosition.dy - _textHeight - 5;
                    final bool topBound =
                        panStartPosition.dy <= _textPosition.dy + 5;

                    if (leftBound && rightBound && topBound && bottomBound) {
                      sourcePoint = panStartPosition;
                      firstValue = i;
                    }
                  }
                },
                onPanEnd: (DragEndDetails details) {
                  int endPoint;

                  for (int i = 0; i < widget.question.images.length; i++) {
                    final RenderBox renderBox =
                        _imageKey[i].currentContext.findRenderObject();
                    final Offset _imagePosition =
                        renderBox.localToGlobal(Offset.zero);

                    final bool leftBound =
                        panEndPosition.dx >= _imagePosition.dx - 5;
                    final bool topBound =
                        panEndPosition.dy >= _imagePosition.dy - 5;
                    final bool rightBound = panEndPosition.dx <=
                        _imagePosition.dx + _imageWidth + 5;
                    final bool bottomBound = panEndPosition.dy >=
                        _imagePosition.dy - _imageHeight - 5;

                    if (leftBound && rightBound && topBound && bottomBound) {
                      destinationPoint = panEndPosition;
                      endPoint = i;
                    }
                  }
                  setState(() {
                    if (sourcePoint != null && destinationPoint != null) {
                      permanentLines[firstValue] = [
                        sourcePoint,
                        destinationPoint
                      ];
                      completed[firstValue] = {
                        'source': firstValue,
                        'destination': endPoint,
                      };
                    }
                  });

                  // Checking the results
                  bool correct = true;
                  bool allAttempted = true;
                  for (int i = 0; i < completed.length; i++) {
                    if (completed[i] == null) {
                      allAttempted = false;
                      break;
                    }

                    final int imageIndex = widget.question.images.indexWhere(
                      (element) => element['text'] == widget.question.texts[i],
                    );

                    if (imageIndex != completed[i]['destination']) {
                      correct = false;
                    }
                  }
                  if (allAttempted &&
                      sourcePoint != null &&
                      destinationPoint != null)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnswerAnimation(
                          correct: correct,
                          nextScreen: correct
                              ? GameAudio(
                                  question: dummyAudioGames[0],
                                )
                              : null,
                        ),
                      ),
                    );
                },
                onPanUpdate: (DragUpdateDetails details) {
                  setState(() {
                    RenderBox box = context.findRenderObject();
                    Offset point = box.globalToLocal(details.globalPosition);
                    points = List.from(points)..add(point);

                    panEndPosition = details.localPosition;
                  });
                },
                child: CustomPaint(
                  painter: MatchingPainter(
                    context: context,
                    points: points,
                    permanentLine: permanentLines,
                  ),
                  child: Container(
                    width: mediaQuery.size.width,
                    height: mediaQuery.size.width,
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
