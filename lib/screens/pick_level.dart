import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:edugamz/screens/flip_phone_alert.dart';

class PickLevel extends StatefulWidget {
  @override
  _PickLevelState createState() => _PickLevelState();
}

class _PickLevelState extends State<PickLevel> {
  double _selectedLevel = 100;
  final List<Map<String, dynamic>> levels = [
    {
      'index': 1,
      'level': 'I can make sentences',
    },
    {
      'index': 2,
      'level': 'I know to use a compass',
    },
    {
      'index': 3,
      'level': 'Mixed fractions exists!',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    return SafeArea(
      child: Scaffold(
        body: isLandscape
            ? Center(
                child: SizedBox(
                  width: mediaQuery.size.width * 0.75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Pick your Level',
                        style: const TextStyle(
                          fontSize: 45.0,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: levels
                            .map(
                              (level) => Expanded(
                                child: SizedBox(
                                  height: 90.0,
                                  width: mediaQuery.size.width * 0.5,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            height: 60.0,
                                            width: 60.0,
                                            decoration: BoxDecoration(
                                              color: Colors.red[200],
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Container(
                                            height: 50.0,
                                            width: 50.0,
                                            decoration: BoxDecoration(
                                              color: Colors.yellow,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              level['index'].toString(),
                                              style: TextStyle(
                                                fontSize: 25.0,
                                                color: Colors.red[300],
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        level['level'],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 20.0),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 100.0,
                              width: mediaQuery.size.width * 0.75,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      color: Colors.lightGreen,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Colors.orange[100],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Colors.cyan,
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
                              height: 100.0,
                              width: mediaQuery.size.width * 0.75,
                              padding: EdgeInsets.symmetric(
                                horizontal: mediaQuery.size.width * 0.1,
                              ),
                              child: CupertinoSlider(
                                // divisions: 2,
                                min: 100,
                                max: 300,
                                thumbColor: Colors.pink,
                                value: _selectedLevel,
                                activeColor: Colors.white,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedLevel = value;
                                  });
                                },
                                onChangeEnd: (value) =>
                                    Navigator.pushReplacementNamed(
                                        context, '/category'),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            : FlipPhoneAlert(),
      ),
    );
  }
}
