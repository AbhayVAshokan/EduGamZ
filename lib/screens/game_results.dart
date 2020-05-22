import 'package:edugamz/screens/flip_phone_alert.dart';
import 'package:edugamz/widgets/game/bottom_bar.dart';
import 'package:edugamz/widgets/game/top_bar.dart';
import 'package:flutter/material.dart';

class GameResults extends StatelessWidget {
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
                          child: LayoutBuilder(
                            builder: (context, constraints) => Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: mediaQuery.size.height * 0.75,
                                height: constraints.maxHeight * 0.75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.yellow,
                                ),
                              ),
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
          )
        : FlipPhoneAlert();
  }
}
