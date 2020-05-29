// Choos level of user knowledge.

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PickLevel extends StatefulWidget {
  @override
  _PickLevelState createState() => _PickLevelState();
}

class _PickLevelState extends State<PickLevel> {
  double _selectedLevel = 0;
  final List<Map<String, dynamic>> levels = [
    {
      'index': 1,
      'level': 'I can make sentences.',
      'color': const Color(0xffe2b389),
    },
    {
      'index': 2,
      'level': 'I know to use a compass',
      'color': const Color(0xff7c7658),
    },
    {
      'index': 3,
      'level': 'Mixed fractions exists!',
      'color': const Color(0xff748d8c),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: mediaQuery.size.width,
            height: mediaQuery.size.height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: mediaQuery.size.height * 0.12 +
                      mediaQuery.size.height * 0.09 +
                      160,
                  width: mediaQuery.size.width * 0.75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: mediaQuery.size.height * 0.12,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: const Text(
                            'Pick your Level',
                            style: const TextStyle(
                              fontSize: 42.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      SizedBox(
                        height: mediaQuery.size.height * 0.09 + 50,
                        child: Row(
                          children: levels
                              .map(
                                (level) => Expanded(
                                  child: SizedBox(
                                    width: mediaQuery.size.width * 0.5,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              height: mediaQuery.size.height *
                                                      0.09 +
                                                  10,
                                              width: mediaQuery.size.height *
                                                      0.09 +
                                                  10,
                                              decoration: BoxDecoration(
                                                color: const Color(0xffe2b389),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            Container(
                                              height:
                                                  mediaQuery.size.height * 0.09,
                                              width:
                                                  mediaQuery.size.height * 0.09,
                                              decoration: BoxDecoration(
                                                color: const Color(0xfffbff42),
                                                shape: BoxShape.circle,
                                              ),
                                              alignment: Alignment.center,
                                              child: FittedBox(
                                                child: Text(
                                                  level['index'].toString(),
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                    color:
                                                        const Color(0xffb58410),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 40.0,
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            level['level'],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: level['color'],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      SizedBox(
                        height: 90,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 90,
                                width: mediaQuery.size.width * 0.75,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: const Color(0xffccde00),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: const Color(0xffffdc81),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: const Color(0xff79cdc9),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 10.0,
                                width: mediaQuery.size.width * 0.75,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                margin: EdgeInsets.symmetric(
                                  horizontal: mediaQuery.size.width * 0.1,
                                ),
                              ),
                              Container(
                                height: 110.0,
                                width: mediaQuery.size.width * 0.75,
                                padding: EdgeInsets.symmetric(
                                  horizontal: mediaQuery.size.width * 0.1,
                                ),
                                child: CupertinoSlider(
                                  min: 0,
                                  max: 1,
                                  thumbColor: const Color(0xffac4d4e),
                                  value: _selectedLevel,
                                  activeColor: Colors.white,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedLevel = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: mediaQuery.size.height / 2 -
                      mediaQuery.size.height * 0.15 -
                      (mediaQuery.size.height * 0.15 + 80) +
                      45,
                  left: mediaQuery.size.width * 0.125 +
                      mediaQuery.size.width * 0.1 +
                      (mediaQuery.size.width * 0.55 - 50) * _selectedLevel,
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, '/category'),
                    child: Image.asset(
                      'assets/images/hand_pointing_up.png',
                      height: mediaQuery.size.height * 0.15,
                      width: mediaQuery.size.height * 0.15,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  right: 10.0,
                  child: Text(
                    'Click on the hand to continue',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
