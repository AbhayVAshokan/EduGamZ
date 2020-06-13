// Sequece in which the game should proceed.

import 'package:flutter/widgets.dart';

import './questions.dart';
import '../screens/game/speak_answer.dart';
import '../screens/game/circle_answer.dart';
import '../screens/game/fill_container.dart';
import '../screens/game/drag_and_drop_answer.dart';
import '../screens/game/multiple_choice_question.dart';
import '../screens/game/match_the_following_text.dart';
import '../screens/game/more_than_one_correct_answer.dart';

List<Widget> gameScreen = [
  MultipleChoiceQuestion(
    question: mcqQuestions[0],
  ),
  MoreThanOneCorrectAnswer(
    question: moreThanOneCorrectQuestions[0],
  ),
  CircleAnswer(
    question: moreThanOneCorrectQuestions[1],
  ),
  SpeakAnswer(
    question: speakingAnswerQuestions[0],
  ),
  MatchTheFollowingText(
    question: matchTheFollowingQuestions[0],
  ),
  FillContainer(
    question: containerFillingQuestions[0],
  ),
  DragAndDropAnswer(
    question: dragAndDropQuestions[0],
  ),
];
