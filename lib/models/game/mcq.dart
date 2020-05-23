// Class to represent MCQ questions.

import 'package:flutter/foundation.dart';

class MCQ {
  final String question;
  final String correctAnswer;
  final List<String> options;

  MCQ({
    @required this.question,
    @required this.options,
    @required this.correctAnswer,
  });
}
