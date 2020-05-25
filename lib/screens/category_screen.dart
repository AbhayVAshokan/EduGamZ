// Screen to choose between the categories: Choose theme, Make your game.

import 'dart:math';

import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SafeArea(
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
                      width: mediaQuery.size.width * 0.3,
                      height: mediaQuery.size.height * 0.75,
                      decoration: BoxDecoration(
                        color: const Color(0xffccde00),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50.0),
                          bottomRight: Radius.circular(50.0),
                        ),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20.0),
                      child: Transform.rotate(
                        angle: pi / 2,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: const Text(
                            'Pick\nTheme',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
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
              Expanded(
                child: const Text(
                  'Swipe out the card you choose',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.blueGrey,
                  ),
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
                    width: mediaQuery.size.width * 0.3,
                    height: mediaQuery.size.height * 0.75,
                    decoration: BoxDecoration(
                      color: const Color(0xffccde00),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        bottomLeft: Radius.circular(50.0),
                      ),
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20.0),
                    child: Transform.rotate(
                      angle: -pi / 2,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: const Text(
                          'Make\nYour Game',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
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
    );
  }
}
