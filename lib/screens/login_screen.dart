import 'package:edugamz/models/avatar.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: mediaQuery.size.width,
          height: mediaQuery.size.height,

          // color: Colors.blue[50],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Choose your Avatar',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: const Color(0xff3090BD),
                      fontFamily: 'Quintessential',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 200.0,
                  width: 200.0,
                  child: PageView.builder(
                    itemBuilder: (context, index) => Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            avatars[index].image,
                          ),
                        ),
                      ),
                    ),
                    itemCount: avatars.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 350.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.red,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[200],
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 35.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
