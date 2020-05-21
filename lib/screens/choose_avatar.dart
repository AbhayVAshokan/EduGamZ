import 'package:flutter/material.dart';

import '../models/avatar.dart';
import '../widgets/setup_screens/avatar_card.dart';

class ChooseAvatar extends StatefulWidget {
  @override
  _ChooseAvatarState createState() => _ChooseAvatarState();
}

class _ChooseAvatarState extends State<ChooseAvatar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Choose Your Avatar',
                    style: const TextStyle(
                      fontFamily: 'QuintEssential',
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: GridView.count(
                  padding: const EdgeInsets.all(20.0),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  children: avatars
                      .map(
                        (avatar) => AvatarCard(
                          avatar: avatar,
                          rebuildScreen: () {
                            setState(() {});
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
