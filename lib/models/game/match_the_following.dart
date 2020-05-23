  // Class to represent Match-the-following questions.

import 'package:flutter/foundation.dart';

class MatchTheFollowing {
  final String question;
  final List<String> texts;
  final List<Map<String, dynamic>> images;

  MatchTheFollowing({
    @required this.question,
    @required this.texts,
    @required this.images,
  });
}
