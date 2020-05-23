// Screen to choose between the categories: Choose theme, Make your game.

import 'package:flutter/material.dart';

import '../screens/flip_phone_alert.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    return isLandscape
        ? SafeArea(
            child: Scaffold(
              body: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onHorizontalDragEnd: (details) {
                        if (details.primaryVelocity > 200)
                          Navigator.pushNamed(context, '/theme');
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: mediaQuery.size.width * 0.25,
                            height: mediaQuery.size.height * 0.75,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.lightGreen[600],
                                const Color(0xffcbd918),
                              ]),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50.0),
                                bottomRight: Radius.circular(50.0),
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(20.0),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: const Text(
                                'Pick\nTheme',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/images/swipe_right.png',
                            height: 50.0,
                            width: 50.0,
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Swipe out the card\nyou choose',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/images/swipe_left.png',
                          height: 50.0,
                          width: 50.0,
                        ),
                        Container(
                          width: mediaQuery.size.width * 0.25,
                          height: mediaQuery.size.height * 0.75,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              const Color(0xffcbd918),
                              Colors.lightGreen[600],
                            ]),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              bottomLeft: Radius.circular(50.0),
                            ),
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(20.0),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: const Text(
                              'Make\nYour Game',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        : FlipPhoneAlert();
  }
}
