// Game where the user needs to shade the fraction of container.

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../widgets/game/top_bar.dart';
import '../../widgets/game/bottom_bar.dart';
import '../../models/game/container_filling.dart';
import '../../widgets/game/fill_container/beaker.dart';
import '../../widgets/game/fill_container/calculation_canvas.dart';

class FillContainer extends StatefulWidget {
  final ContainerFilling question;

  FillContainer({@required this.question});

  @override
  FillContainerState createState() => FillContainerState();
}

class FillContainerState extends State<FillContainer> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                TopBar(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: LayoutBuilder(
                                    builder: (context, constraints) =>
                                        Container(
                                      height: mediaQuery.size.height * 0.9,
                                      width: mediaQuery.size.width,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 30.0,
                                        vertical: 20.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      alignment: Alignment.center,
                                      child: AutoSizeText(
                                        widget.question.question,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          letterSpacing: 0.5,
                                        ),
                                        maxLines: 5,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: CalculationCanvas(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Beaker(),
                        )
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
    );
  }
}
