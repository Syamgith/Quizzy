import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizzy_flutter/models/question.dart';
import 'package:quizzy_flutter/questions_lib.dart';
import 'package:quizzy_flutter/screens/result_screen.dart';
import 'package:quizzy_flutter/widgets/option_button.dart';
import 'package:quizzy_flutter/widgets/quiztitle_container.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PlayScreen extends StatefulWidget {
  PlayScreen({Key key}) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  QuestionsLib questionsLib;
  List quiz;
  List options;
  int questionNo = 0;
  bool isWaiting = true;
  bool fistClick = true;
  int points = 0;
  Question currentQuestion;
  List<Color> colours = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  bool showCorrect;
  bool cancelTimer = false;
  int timeCount = 15;
  @override
  void initState() {
    super.initState();
    questionsLib = QuestionsLib();
    getQuiz();
  }

  void getQuiz() async {
    isWaiting = true;
    quiz = await questionsLib.getQuestions();
    if (quiz != null) {
      loadQuestion();
    }
  }

  void loadQuestion() {
    if (quiz != null) {
      if (questionNo >= 5) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Result(points)));
      } else {
        setState(() {
          fistClick = true;
          cancelTimer = false;
          timeCount = 15;
          isWaiting = false;
          currentQuestion = quiz[questionNo];
          options = currentQuestion.options.keys.toList();
          questionNo++;
          colours = [
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
          ];
          startTimer();
        });
      }
    } else {
      getQuiz();
    }
  }

  void checkAnswer(isTrue, id) {
    if (fistClick) {
      setState(() {
        colours[id] = isTrue ? Colors.green : Colors.red;
        points = isTrue ? points += 10 : points -= 5;
        showCorrect = isTrue ? true : false;
        cancelTimer = true;
      });

      Timer(Duration(seconds: 2), loadQuestion);
    }
    fistClick = false;
  }

  void startTimer() async {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (timeCount < 1) {
        t.cancel();
        loadQuestion();
      } else if (cancelTimer) {
        t.cancel();
      } else {
        setState(() {
          timeCount--;
        });
      }
    });
  }

  @override
  void dispose() {
    cancelTimer = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: isWaiting
          ? SpinKitDoubleBounce(
              color: Colors.pink,
              size: 100,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuizTitleContainer(
                  title: questionNo.toString(),
                  subtitle: !isWaiting ? currentQuestion.question : '',
                  correct: !fistClick ? showCorrect : null,
                  timer: timeCount,
                  points: points,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 15, right: 20, left: 20, bottom: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        OptionButton(
                            id: 0,
                            option: options[0],
                            isTrue: currentQuestion.options[options[0]],
                            onPress: checkAnswer,
                            colour: colours[0]),
                        OptionButton(
                            id: 1,
                            option: options[1],
                            isTrue: currentQuestion.options[options[1]],
                            onPress: checkAnswer,
                            colour: colours[1]),
                        OptionButton(
                          id: 2,
                          option: options[2],
                          isTrue: currentQuestion.options[options[2]],
                          onPress: checkAnswer,
                          colour: colours[2],
                        ),
                        OptionButton(
                            id: 3,
                            option: options[3],
                            isTrue: currentQuestion.options[options[3]],
                            onPress: checkAnswer,
                            colour: colours[3]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
