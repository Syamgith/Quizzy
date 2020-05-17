import 'dart:convert';

import 'package:http/http.dart' as http;

class QuestionsLib {
  List<Question> quiz = [];

  void fetchingData() async {
    var response =
        await http.get('http://www.mocky.io/v2/5ebd2f5f31000018005b117f');
    if (response.statusCode == 200) {
      //return Album.fromJson(json.decode(response.body));
      fromJson(json.decode(response.body));
    } else {
      print(response.statusCode);
    }
  }

  void fromJson(data) {
    for (var quizQuestions in data['Quiz Questions']) {
      Map<String, bool> optionsl = {};
      optionsl.clear();
      String questionl = quizQuestions['Questions'];
      for (var answers in quizQuestions['Answers']) {
        String option = answers['Answers'];
        bool isTrue = answers['isTrue'];
        optionsl[option] = isTrue;
      }
      //print(optionsl);
      Question q = Question(question: questionl, options: optionsl);
      quiz.add(q);
    }
    for (var q in quiz) {
      print(q.question);
      print(q.options);
    }
  }
}

class Question {
  Question({this.question, this.options});
  String question;
  Map<String, bool> options;
}
