// All the dummy data are listed in this file till the backend is functional.

import 'package:flutter/material.dart';

import '../models/themes.dart';
import '../models/game/mcq.dart';
import '../models/game/match_the_following.dart';
import '../models/game/more_than_one_correct.dart';

// List of all available themes
List<Themes> dummyThemes = [
  Themes(
    name: 'Day at School',
    color: const Color(0xfff8b2b2),
    image: 'assets/images/themes/school.png',
  ),
  Themes(
    name: 'Visit to the Zoo',
    color: const Color(0xffabaea5),
    image: 'assets/images/themes/zoo.png',
  ),
  Themes(
    name: 'Treasure Hunt',
    color: const Color(0xfff5bc86),
    image: 'assets/images/themes/treasure.png',
  ),
  Themes(
    name: 'Making Mac n Cheese',
    color: const Color(0xfffcf9ab),
    image: 'assets/images/themes/chef.png',
  ),
  Themes(
    name: 'Project Day',
    color: const Color(0xffbdf6d5),
    image: 'assets/images/themes/project.png',
  ),
  Themes(
    name: 'Bedtime Story',
    color: const Color(0xffe28ef0),
    image: 'assets/images/themes/story.png',
  ),
];

// List of all dummy MCQ questions
List<MCQ> dummyMcqQuestions = [
  MCQ(
    question: 'What is the opposite of healthy?',
    options: ['Week', 'Weak', 'Wick'],
    correctAnswer: 'Weak',
  ),
];

// List of all dummy Match-the-following questions
List<MatchTheFollowing> dummyMatchTheFollowingQuestions = [
  MatchTheFollowing(
      question: 'Match the profession with their tool',
      texts: ['Fisherman', 'Doctor', 'Mechanic'],
      images: null)
];

// List of all dummy More-than-one-correct answer type questions.
List<MoreThanOneCorrect> dummyMoreThanOneCorrect = [
  MoreThanOneCorrect(
    question: 'Pick all aquatic animals',
    options: [
      {
        'text': 'Frog',
        'image': 'assets/images/quiz/quiz_more_than_one/frog.png',
        'correct': true,
      },
      {
        'text': 'Fish',
        'image': 'assets/images/quiz/quiz_more_than_one/fish.png',
        'correct': true,
      },
      {
        'text': 'Butterfly',
        'image': 'assets/images/quiz/quiz_more_than_one/butterfly.png',
        'correct': false,
      },
      {
        'text': 'Crab',
        'image': 'assets/images/quiz/quiz_more_than_one/crab.png',
        'correct': true,
      },
      {
        'text': 'Pig',
        'image': 'assets/images/quiz/quiz_more_than_one/pig.png',
        'correct': false,
      },
    ],
  )
];
