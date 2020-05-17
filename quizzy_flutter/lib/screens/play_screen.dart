import 'package:flutter/material.dart';
import 'package:quizzy_flutter/models/question.dart';
import 'package:quizzy_flutter/questions_lib.dart';
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
  int questionNo = 1;
  bool isWaiting = true;
  Question currentQuestion;
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
      setState(() {
        isWaiting = false;
        currentQuestion = quiz[0];
        options = currentQuestion.options.keys.toList();
      });
    }
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
                  OptionButton(!isWaiting ? options[0] : ''),
                  OptionButton(!isWaiting ? options[1] : ''),
                  OptionButton(!isWaiting ? options[2] : ''),
                  OptionButton(!isWaiting ? options[3] : ''),
                  Container(
                    height: 40,
                    width: double.infinity,
                    //color: Colors.pink,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
