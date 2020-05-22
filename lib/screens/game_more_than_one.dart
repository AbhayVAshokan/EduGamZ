import 'package:edugamz/models/game/more_than_one_correct.dart';
import 'package:edugamz/screens/flip_phone_alert.dart';
import 'package:edugamz/widgets/game/bottom_bar.dart';
import 'package:edugamz/widgets/game/question.dart';
import 'package:edugamz/widgets/game/top_bar.dart';
import 'package:flutter/material.dart';

class GameMoreThanOne extends StatefulWidget {
  final MoreThanOneCorrect question;
  GameMoreThanOne({@required this.question});

  @override
  _GameMoreThanOneState createState() => _GameMoreThanOneState();
}

class _GameMoreThanOneState extends State<GameMoreThanOne>
    with TickerProviderStateMixin {
  List<AnimationController> animationController = [];
  List<Animation> animation = [];

  @override
  initState() {
    super.initState();

    for (int i = 0; i < widget.question.options.length; i++) {
      animationController.add(
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 250),
        ),
      );

      animation.add(ColorTween(begin: Colors.white, end: Colors.yellow)
          .animate(animationController[i]));
    }
  }

  Widget moreThanOneOption({
    @required Map<String, dynamic> option,
    @required AnimationController animationController,
    @required Animation animation,
  }) {
    return AnimatedBuilder(
      animation: animation,
      builder: (ctx, child) => GestureDetector(
        onTap: () {
          if (animation.value == Colors.white)
            animationController.forward();
          else
            animationController.reverse();
        },
        child: Container(
          width: 100.0,
          height: 95,
          margin: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 5.0,
          ),
          decoration: BoxDecoration(
            color: animation.value,
            border: Border.all(),
            borderRadius: BorderRadius.circular(30.0),
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(
                child: Image.asset(option['image']),
              ),
              Text(
                option['text'],
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    return isLandscape
        ? SafeArea(
            child: Scaffold(
              body: SizedBox(
                height: mediaQuery.size.height,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        TopBar(),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20.0),
                              Question(question: widget.question.question),
                              const SizedBox(height: 20.0),
                              Expanded(
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  children: [
                                    for (int i = 0;
                                        i < widget.question.options.length;
                                        i++)
                                      moreThanOneOption(
                                        option: widget.question.options[i],
                                        animation: animation[i],
                                        animationController:
                                            animationController[i],
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    BottomBar(),
                  ],
                ),
              ),
            ),
          )
        : FlipPhoneAlert();
  }
}
