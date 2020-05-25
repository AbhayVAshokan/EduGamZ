import 'package:edugamz/models/avatar.dart';
import 'package:flutter/material.dart';

import 'leaderboard_card.dart';

List<Map<String, dynamic>> leaderboardData = [
  {
    'score': 4753,
    'name': 'You',
    'avatar': avatars[0],
  },
  {
    'score': 3600,
    'name': 'Salman',
    'avatar': avatars[1],
  },
  {
    'score': 3100,
    'name': 'Kareena',
    'avatar': avatars[2],
  },
  {
    'score': 3050,
    'name': 'Sonam',
    'avatar': avatars[3],
  },
  {
    'score': 1200,
    'name': 'Aamir',
    'avatar': avatars[4],
  },
  {
    'score': 10,
    'name': 'Hrithik',
    'avatar': avatars[5],
  },
];

showLeaderBoard({@required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.yellow[400],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz/win.png',
            height: 30.0,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 10.0),
          Text(
            'Game Results',
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Quintessential',
            ),
          ),
        ],
      ),
      content: SizedBox(
        height: 300,
        width: 300,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            childAspectRatio: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 20.0,
          ),
          itemCount: leaderboardData.length,
          itemBuilder: (context, index) => LeaderBoardCard(
            item: leaderboardData[index],
            rank: index+1,
          ),
        ),
      ),
    ),
  );
}
