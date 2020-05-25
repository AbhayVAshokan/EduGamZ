// Individual avatar cards.

import 'package:flutter/material.dart';

import '../../models/avatar.dart';
import '../../resources/realtime_data.dart';

class AvatarCard extends StatefulWidget {
  final Avatar avatar;
  final Function rebuildScreen;

  AvatarCard({
    @required this.avatar,
    @required this.rebuildScreen,
  });

  @override
  _AvatarCardState createState() => _AvatarCardState();
}

class _AvatarCardState extends State<AvatarCard> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _scaleAnimation;
  Animation _colorAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween(
      begin: 0.9,
      end: 1,
    ).animate(_animationController);
    _colorAnimation = ColorTween(
      begin: Colors.amber[300],
      end: widget.avatar.color,
    ).animate(_animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) => GestureDetector(
        onTap: () {
          playerAvatar = widget.avatar.name;
          _animationController.forward();
          widget.rebuildScreen();
        },
        child: FittedBox(
          child: Container(
            width: mediaQuery.size.width / 2,
            height: mediaQuery.size.width / 2,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  _colorAnimation.value,
                  Colors.white,
                ],
              ),
              boxShadow: [
                // BoxShadow(
                //   offset: const Offset(0.0, 5.0),
                //   color: Colors.grey[300],
                //   blurRadius: 5.0,
                // )
              ],
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(
                  widget.avatar.image,
                ),
              ),
            ),
            child: Text(
              widget.avatar.name,
              style: const TextStyle(
                fontFamily: 'QuintEssential',
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
