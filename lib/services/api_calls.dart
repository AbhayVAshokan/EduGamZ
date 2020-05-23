// All the API requests are listed in this single file

import '../resources/dummy_data.dart';
import '../resources/realtime_data.dart';

// API to retreive all the available themes
getThemes() {
  themes = dummyThemes;
}

// API to retreive all the questions for the current quiz.
getQuestions() {
  mcqQuestions = dummyMcqQuestions;
  matchTheFollowingQuestions = dummyMatchTheFollowingQuestions;
  moreThanOneCorrect = dummyMoreThanOneCorrect;
}
