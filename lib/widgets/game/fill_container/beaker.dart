// Display beaker for the fill-container screen.

import 'package:flutter/material.dart';

import './coloring_canvas.dart';

class Beaker extends StatelessWidget {
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double _imageHeight = mediaQuery.size.height * 0.6;

    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/game/beaker.png',
            fit: BoxFit.contain,
            height: _imageHeight,
          ),
          Container(
            width: _imageHeight,
            height: _imageHeight,
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: SizedBox(
                height: _imageHeight * 25 / 29,
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
          ColoringCanvas(
            imageHeight: _imageHeight,
            imageWidth: _imageHeight * 41 / 58,
          ),
        ],
      ),
    );
  }
}
