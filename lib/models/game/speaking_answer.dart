// Answer the question as an audio: Speech to text converter.

import 'package:flutter/foundation.dart';

class SpeakingAnswer {
  final String question;
  final List<String> answers;

  SpeakingAnswer({
    @required this.answers,
    @required this.question,
  });
}
