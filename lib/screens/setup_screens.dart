import 'package:edugamz/screens/choose_avatar.dart';
import 'package:flutter/material.dart';

class SetupScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          // physics: NeverScrollableScrollPhysics(),
          children: [
            ChooseAvatar(),
          ],
        ),
      ),
    );
  }
}
