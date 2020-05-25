import 'package:flutter/material.dart';

import './coloring_canvas.dart';

class Beaker extends StatelessWidget {
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/images/quiz/beaker.png',
              fit: BoxFit.contain, height: 225),
          Container(
            width: 215.714285714,
            height: 225,
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: SizedBox(
                height: 225 * 25 / 29,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (var i = 1000; i >= 0; i -= 100)
                      Text(
                        '-- $i',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.blueGrey,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          ColoringCanvas(),
        ],
      ),
    );
  }
}
