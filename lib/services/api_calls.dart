// Get all themes
import 'package:edugamz/models/game/match_the_following.dart';
import 'package:edugamz/models/game/mcq.dart';
import 'package:edugamz/models/game/more_than_one_correct.dart';
import 'package:flutter/material.dart';

import 'package:edugamz/models/themes.dart';
import 'package:edugamz/resources/realtime_data.dart';

getThemes() {
  themes = [
    Themes(
      name: 'Day at School',
      color: const Color(0xfff3b4b6),
      image: 'assets/images/themes/school.png',
    ),
    Themes(
      name: 'Visit to the Zoo',
      color: const Color(0xffa9ada7),
      image: 'assets/images/themes/zoo.png',
    ),
    Themes(
      name: 'Treasure Hunt',
      color: const Color(0xfff0bd8f),
      image: 'assets/images/themes/treasure.png',
    ),
    Themes(
      name: 'Making Mac n Cheese',
      color: const Color(0xfffaf8b4),
      image: 'assets/images/themes/chef.png',
    ),
    Themes(
      name: 'Project Day',
      color: const Color(0xffc1f3d7),
      image: 'assets/images/themes/project.png',
    ),
    Themes(
      name: 'Bedtime Story',
      color: const Color(0xffe28ef0),
      image: 'assets/images/themes/story.png',
    ),
  ];
}

getQuestions() {
  mcqQuestions = [
    MCQ(
      question: 'What is the opposite of healthy?',
      options: ['Week', 'Weak', 'Wick'],
      correctAnswer: 'Weak',
    ),
  ];

  matchTheFollowingQuestions = [
    MatchTheFollowing(
        question: 'Match the profession with their tool',
        texts: ['Fisherman', 'Doctor', 'Mechanic'],
        images: null)
  ];

  moreThanOneCorrect = [
    MoreThanOneCorrect(
      question: 'Pick all aquatic animals',
      options: [
        {
          'text': 'Frog',
          'Image': null,
          'correct': true,
        },
        {
          'text': 'Fish',
          'Image': null,
          'correct': true,
        },
        {
          'text': 'Butterfly',
          'Image': null,
          'correct': false,
        },
        {
          'text': 'Crab',
          'Image': null,
          'correct': true,
        },
        {
          'text': 'Pig',
          'Image': null,
          'correct': false,
        },
      ],
    )
  ];
}
