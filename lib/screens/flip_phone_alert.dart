import 'package:flutter/material.dart';

class FlipPhoneAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: const AssetImage(
                        'assets/images/icon.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
              Expanded(
                child: Image.asset(
                  'assets/images/landscape.jpg',
                  fit: BoxFit.contain,
                  width: mediaQuery.size.width,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Flip phone horizontally\nto continue',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Quintessential',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[800],
                          ),
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/landscape.png',
                      fit: BoxFit.contain,
                      width: 150.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
