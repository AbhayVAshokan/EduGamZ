import 'package:edugamz/models/theme.dart';
import 'package:edugamz/widgets/pick_theme/theme_card.dart';
import 'package:flutter/material.dart';

import 'package:edugamz/screens/flip_phone_alert.dart';

class PickTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    return isLandscape
        ? SafeArea(
            child: Scaffold(
              body: Center(
                child: SizedBox(
                  width: mediaQuery.size.width * 0.6,
                  child: Column(
                    children: [
                      Container(
                        height: 60.0,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(vertical: 30.0),
                        decoration: BoxDecoration(
                          color: const Color(0xffcbd918),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: const Text(
                          'Pick Theme',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 45.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200.0,
                            childAspectRatio: 1,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 20.0,
                          ),
                          itemBuilder: (context, index) =>
                              ThemeCard(themeData: themes[index]),
                          itemCount: themes.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : FlipPhoneAlert();
  }
}
