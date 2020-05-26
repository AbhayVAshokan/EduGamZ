// Game where the user needs to shade the fraction of container.

import 'package:flutter/material.dart';

import '../widgets/game/top_bar.dart';
import '../widgets/game/bottom_bar.dart';
import '../widgets/game/fill_container/beaker.dart';

class GameFillContainer extends StatefulWidget {
  @override
  GameFillContainerState createState() => GameFillContainerState();
}

class GameFillContainerState extends State<GameFillContainer> {
  final String question =
      'A 1 litre beaker is filled with 500mL of water . 250mL is added later. 0.05L is removed and only 30mL condensed water is collected. Indicate the quantity of water left in the beaker (in mL).';
  final double solution = 670.0;

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
                                  flex: 5,
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
                                      child: Text(
                                        question,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: constraints.maxHeight < 150
                                              ? 12.0
                                              : 15.0,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(),
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
