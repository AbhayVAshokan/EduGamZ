// Individual theme cards in the pick-theme screen.

import 'package:flutter/material.dart';

import '../../models/themes.dart';

class ThemeCard extends StatelessWidget {
  final Themes themeData;
  ThemeCard({@required this.themeData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/countdown'),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: themeData.color,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400],
              blurRadius: 5.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  themeData.image,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  themeData.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[700],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
