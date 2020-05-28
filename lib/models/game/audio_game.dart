// Answer the question as an audio: Speech to text converter.

import 'package:flutter/foundation.dart';

class AudioGame {
  final String question;
  final List<String> answers;

  AudioGame({
    @required this.answers,
    @required this.question,
  });
}
