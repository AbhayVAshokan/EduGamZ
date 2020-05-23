import '../models/themes.dart';
import '../models/game/mcq.dart';
import '../models/game/match_the_following.dart';
import '../models/game/more_than_one_correct.dart';

String playerAvatar;

List<Themes> themes = [];

// Lists of different types of questions.
List<MCQ> mcqQuestions = [];
List <MatchTheFollowing> matchTheFollowingQuestions = [];
List<MoreThanOneCorrect> moreThanOneCorrect = [];