// Drag and drop the source objects into the target in the specified order.

import 'dart:async';

import 'package:flutter/material.dart';

import '../answer_animation.dart';
import '../../widgets/game/top_bar.dart';
import '../../widgets/game/bottom_bar.dart';
import '../../resources/realtime_data.dart';
import '../../models/game/drag_and_drop.dart';

class DragAndDropAnswer extends StatefulWidget {
  final DragAndDrop question;

  DragAndDropAnswer({@required this.question});

  @override
  _DragAndDropAnswerState createState() => _DragAndDropAnswerState();
}

class _DragAndDropAnswerState extends State<DragAndDropAnswer> {
  List order = [];
  List ingredients;
  var lastIngredient;

  @override
  void initState() {
    ingredients = widget.question.data;
    lastIngredient = ingredients.removeLast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    print(order);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: mediaQuery.size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  TopBar(
                    gameNumber: gameNumber,
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.025),
                  Container(
                    height: mediaQuery.size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.75,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 50.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: const Color(0xfffbff42),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              widget.question.question,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.center,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  for (int i = 0; i < ingredients.length; i++)
                                    TextSpan(
                                      text: ingredients[i]['ingredient'] + ', ',
                                    ),
                                  TextSpan(
                                    text: 'and ${lastIngredient['ingredient']}',
                                  ),
                                ],
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.orange[800],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) => Container(
                        width: mediaQuery.size.width * 0.8,
                        height: constraints.maxHeight * 0.5,
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0;
                                i < widget.question.data.length;
                                i++)
                              Draggable<String>(
                                data: widget.question.data[i]['ingredient'],
                                child: Image.asset(
                                  order.contains(
                                          widget.question.data[i]['ingredient'])
                                      ? 'assets/images/game/drag_and_drop_ingredients/check.png'
                                      : widget.question.data[i]['image'],
                                  height: constraints.maxHeight * 0.5,
                                ),
                                childWhenDragging: Opacity(
                                  opacity: 0.25,
                                  child: Image.asset(
                                    widget.question.data[i]['image'],
                                    height: constraints.maxHeight * 0.5,
                                  ),
                                ),
                                feedback: Image.asset(
                                  widget.question.data[i]['image'],
                                  height: constraints.maxHeight * 0.5,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: DragTarget(
                      onAccept: (data) {
                        if (!order.contains(data))
                          setState(() {
                            order.add(data);
                          });
                        if (order.length == widget.question.data.length) {
                          // Check correctness
                          bool correct = true;
                          for (int i = 0;
                              i < widget.question.data.length;
                              i++) {
                            if (order[i] !=
                                widget.question.data[i]['ingredient'])
                              correct = false;
                          }

                          Timer(const Duration(milliseconds: 500), () {
                            if (correct)
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AnswerAnimation(
                                    correct: correct,
                                  ),
                                ),
                              );
                            else {
                              setState(() {
                                order = [];
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AnswerAnimation(
                                      correct: correct,
                                    ),
                                  ),
                                );
                              });
                            }
                          });
                        }
                      },
                      builder: (context, candidateData, rejectedData) =>
                          Image.asset(
                        widget.question.container,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.size.height * 0.03,
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
