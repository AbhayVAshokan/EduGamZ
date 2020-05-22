  // Change the hierarchy to include answers

import 'package:flutter/foundation.dart';

class MatchTheFollowing {
  final String question;
  final List<String> texts;
  final List<String> images;

  MatchTheFollowing({
    @required this.question,
    @required this.texts,
    @required this.images,
  });
}
