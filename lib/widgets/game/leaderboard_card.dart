import 'package:flutter/material.dart';

class LeaderBoardCard extends StatelessWidget {
  final item;
  final int rank;

  LeaderBoardCard({
    @required this.item,
    @required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 75.0,
          height: 75.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                item['avatar'].image,
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                item['name'],
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                item['score'].toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
