// Speak out the solution to the question.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_recognition/speech_recognition.dart';

import '../answer_animation.dart';
import '../../widgets/game/top_bar.dart';
import '../../widgets/game/question.dart';
import '../../widgets/game/bottom_bar.dart';
import '../../resources/realtime_data.dart';
import '../../models/game/speaking_answer.dart';
import '../../resources/screen_transitions.dart';
import '../../resources/game__screen_sequence.dart';

class SpeakAnswer extends StatefulWidget {
  final SpeakingAnswer question;

  SpeakAnswer({
    @required this.question,
  });

  @override
  _GameAudioState createState() => _GameAudioState();
}

class _GameAudioState extends State<SpeakAnswer> {
  String resultText = "";
  String text = 'Tap to Speak';
  Color containerColor = const Color(0xfffaedf0);
  Color resultTextColor = Colors.black;

  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;

  // Ask for using microphone
  Future askForPermissions() async {
    if (await Permission.contacts.request().isGranted) {}
    Map<Permission, PermissionStatus> statuses = await [
      Permission.microphone,
    ].request();
    print(statuses[Permission.microphone]);
  }

  initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler((result) {
      setState(() {
        _isAvailable = result;
      });
    });

    _speechRecognition.setRecognitionStartedHandler(() {
      setState(() {
        _isListening = true;
      });
    });

    _speechRecognition.setRecognitionResultHandler((text) {
      setState(() {
        resultText = text;
        final bool correct = widget.question.answers.contains(resultText);

        Timer(
          const Duration(milliseconds: 500),
          () => Navigator.push(
            context,
            fadeTransition(
              screen: AnswerAnimation(
                correct: correct,
                nextScreen: gameScreen[gameNumber++],
              ),
            ),
          ),
        );
      });
    });

    _speechRecognition.setRecognitionCompleteHandler((value) {
      setState(() {
        _isListening = false;
        resultText = value;
      });
    });

    _speechRecognition.activate().then((result) {
      setState(() {
        _isAvailable = result;
      });
    });
  }

  @override
  void initState() {
    askForPermissions();
    initSpeechRecognizer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: mediaQuery.size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  TopBar(
                    gameNumber: gameNumber,
                  ),
                  const SizedBox(height: 20.0),
                  Question(question: widget.question.question),
                  const SizedBox(height: 20.0),
                  Expanded(
                    child: SizedBox(
                      width: mediaQuery.size.width * 0.75,
                      child: DragTarget(
                        onAccept: (data) => print(data),
                        builder: (context, candidateData, rejectedData) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: mediaQuery.size.height * 0.35 + 26,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onLongPress: () {
                                        setState(() {
                                          containerColor = Colors.red[400];
                                          text = 'Listening...';

                                          if (_isAvailable && !_isListening) {
                                            _speechRecognition
                                                .listen(locale: 'en_US')
                                                .then(
                                                    (result) => print(result));

                                            resultTextColor = Colors.blueGrey;
                                          }
                                        });
                                      },
                                      onLongPressEnd: (details) {
                                        setState(() {
                                          containerColor =
                                              const Color(0xfffaedf0);
                                          text = "Tap to Speak";

                                          if (_isListening)
                                            _speechRecognition
                                                .stop()
                                                .then((result) {
                                              setState(() {
                                                _isListening = result;
                                                resultTextColor = Colors.black;
                                              });
                                            });
                                        });
                                      },
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 250),
                                        width: mediaQuery.size.height * 0.35,
                                        height: mediaQuery.size.height * 0.35,
                                        padding: const EdgeInsets.all(20.0),
                                        decoration: BoxDecoration(
                                          color: containerColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Icon(
                                            Icons.mic,
                                            size: 100.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(
                                      text,
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        letterSpacing: 0.5,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: LayoutBuilder(
                                builder: (context, constraints) => Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: constraints.maxWidth * 0.9,
                                    height: constraints.maxHeight * 0.75,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(20.0),
                                    child: AutoSizeText(
                                      resultText,
                                      maxLines: 10,
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        color: resultTextColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
