// Display the question card

import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;
  Question({
    @required this.question,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Container(
      height: mediaQuery.size.height * 0.12,
      width: MediaQuery.of(context).size.width * 0.75,
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 50.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: const Color(0xfffbff42),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          question,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
