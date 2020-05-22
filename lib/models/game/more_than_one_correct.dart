import 'package:flutter/foundation.dart';

class MoreThanOneCorrect {
  final String question;
  final List<Map<String, dynamic>> options;

  MoreThanOneCorrect({
    @required this.question,
    @required this.options,
  });
}
