import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizzy_flutter/models/question.dart';
import 'package:quizzy_flutter/questions_lib.dart';
import 'package:quizzy_flutter/screens/result_screen.dart';
import 'package:quizzy_flutter/widgets/option_button.dart';
import 'package:quizzy_flutter/widgets/quiztitle_container.dart';

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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Result(points)));
      } else {
        setState(() {
          fistClick = true;
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
      });

      Timer(Duration(seconds: 2), loadQuestion);
    }
    fistClick = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          QuizTitleContainer(
            title: questionNo.toString(),
            subtitle: !isWaiting ? currentQuestion.question : '',
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 40, right: 40, left: 40, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  OptionButton(
                      id: 0,
                      option: !isWaiting ? options[0] : '',
                      isTrue: !isWaiting
                          ? currentQuestion.options[options[0]]
                          : false,
                      onPress: checkAnswer,
                      colour: colours[0]),
                  OptionButton(
                      id: 1,
                      option: !isWaiting ? options[1] : '',
                      isTrue: !isWaiting
                          ? currentQuestion.options[options[1]]
                          : false,
                      onPress: checkAnswer,
                      colour: colours[1]),
                  OptionButton(
                    id: 2,
                    option: !isWaiting ? options[2] : '',
                    isTrue: !isWaiting
                        ? currentQuestion.options[options[2]]
                        : false,
                    onPress: checkAnswer,
                    colour: colours[2],
                  ),
                  OptionButton(
                      id: 3,
                      option: !isWaiting ? options[3] : '',
                      isTrue: !isWaiting
                          ? currentQuestion.options[options[3]]
                          : false,
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
