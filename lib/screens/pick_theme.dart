import 'package:flutter/material.dart';

import '../resources/realtime_data.dart';
import '../widgets/pick_theme/theme_card.dart';

class PickTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: mediaQuery.size.width * 0.6,
            child: Column(
              children: [
                Container(
                  height: mediaQuery.size.height * 0.12,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    vertical: mediaQuery.size.height * 0.06,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffcbd918),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: const Text(
                      'Pick Theme',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) => GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        crossAxisSpacing: mediaQuery.size.width * 0.05,
                        mainAxisSpacing: 20.0,
                      ),
                      itemBuilder: (context, index) =>
                          ThemeCard(themeData: themes[index]),
                      itemCount: themes.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
