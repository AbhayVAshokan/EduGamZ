// All questions are listed in this file till the backend is functional.


import '../models/game/mcq.dart';
import '../models/game/drag_and_drop.dart';
import '../models/game/speaking_answer.dart';
import '../models/game/container_filling.dart';
import '../models/game/match_the_following.dart';
import '../models/game/more_than_one_correct.dart';

// List of all MCQ questions
List<MCQ> mcqQuestions = [
  MCQ(
    question: 'What is the opposite of healthy?',
    options: ['Week', 'Weak', 'Wick'],
    correctAnswer: 'Weak',
  ),
];

// List of all Match-the-following questions
List<MatchTheFollowing> matchTheFollowingQuestions = [
  MatchTheFollowing(
    question: 'Match the profession with their tool',
    texts: ['Fisherman', 'Doctor', 'Mechanic'],
    images: [
      {
        'text': 'Doctor',
        'image': 'assets/images/game/profession/stethoscope.png',
      },
      {
        'text': 'Fisherman',
        'image': 'assets/images/game/profession/fishing_net.png',
      },
      {
        'text': 'Mechanic',
        'image': 'assets/images/game/profession/mechanic.png',
      },
    ],
  )
];

// List of all More-than-one-correct answer type questions.
List<MoreThanOneCorrect> moreThanOneCorrectQuestions = [
  MoreThanOneCorrect(
    question: 'Pick all aquatic animals',
    options: [
      {
        'text': 'Frog',
        'image': 'assets/images/game/aquatic_animals/frog.png',
        'correct': true,
      },
      {
        'text': 'Fish',
        'image': 'assets/images/game/aquatic_animals/fish.png',
        'correct': true,
      },
      {
        'text': 'Butterfly',
        'image': 'assets/images/game/aquatic_animals/butterfly.png',
        'correct': false,
      },
      {
        'text': 'Crab',
        'image': 'assets/images/game/aquatic_animals/crab.png',
        'correct': true,
      },
      {
        'text': 'Pig',
        'image': 'assets/images/game/aquatic_animals/pig.png',
        'correct': false,
      },
    ],
  ),
  MoreThanOneCorrect(
    question: 'Select all the things you need to go to the supermarket.',
    options: [
      {
        'text': 'Money',
        'image': 'assets/images/game/supermarket/cash.png',
        'correct': true,
      },
      {
        'text': 'Popcorn',
        'image': 'assets/images/game/supermarket/popcorn.png',
        'correct': false,
      },
      {
        'text': 'Racquet',
        'image': 'assets/images/game/supermarket/racquet.png',
        'correct': false,
      },
      {
        'text': 'List',
        'image': 'assets/images/game/supermarket/shopping_list.png',
        'correct': true,
      },
      {
        'text': 'Coat',
        'image': 'assets/images/game/supermarket/safety_jacket.png',
        'correct': false,
      },
      {
        'text': 'Bag',
        'image': 'assets/images/game/supermarket/shopping_bag.png',
        'correct': true,
      },
    ],
  ),
];

// List of all audio-game questions
final List<SpeakingAnswer> speakingAnswerQuestions = [
  SpeakingAnswer(
    answers: [
      'young',
      'new',
      'novel',
      'infant',
      'newborn',
      'recent',
    ],
    question: 'What is the opposite of old?',
  )
];

// List of all drag-and-drop type questions.
final List<DragAndDrop> dragAndDropQuestions = [
  DragAndDrop(
    question: 'Drag and drop in the bowl in the given order',
    data: [
      {
        'order': 1,
        'ingredient': 'Mashed Banana',
        'image': 'assets/images/game/ingredients/mashed_banana.png',
      },
      {
        'order': 2,
        'ingredient': 'Eggs',
        'image': 'assets/images/game/ingredients/eggs.png',
      },
      {
        'order': 3,
        'ingredient': 'Sugar',
        'image': 'assets/images/game/ingredients/sugar.png',
      },
      {
        'order': 4,
        'ingredient': 'Milk',
        'image': 'assets/images/game/ingredients/milk.png',
      },
      {
        'order': 5,
        'ingredient': 'Butter',
        'image': 'assets/images/game/ingredients/butter.png',
      },
      {
        'order': 6,
        'ingredient': 'Flour',
        'image': 'assets/images/game/ingredients/flour.png',
      },
    ],
    container: 'assets/images/game/ingredients/vessel.png',
  )
];

// List of questions related to filling container.
List<ContainerFilling> containerFillingQuestions = [
  ContainerFilling(
    question:
        'A 1 litre beaker is filled with 500mL of water . 250mL is added later. 0.05L is removed and only 30mL condensed water is collected. Indicate the quantity of water left in the beaker (in mL).',
    answer: 670.0,
  ),
];
