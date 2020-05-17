import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quizzy_flutter/models/question.dart';

class QuestionsLib {
  Future getQuestions() async {
    List<Question> quiz = [];
    var response =
        await http.get('http://www.mocky.io/v2/5ebd2f5f31000018005b117f');

    if (response.statusCode == 200) {
      var data = (json.decode(response.body));
      for (var quizQuestions in data['Quiz Questions']) {
        Map<String, bool> optionsl = {};
        optionsl.clear();
        String questionl = quizQuestions['Questions'];
        for (var answers in quizQuestions['Answers']) {
          String option = answers['Answers'];
          bool isTrue = answers['isTrue'];
          optionsl[option] = isTrue;
        }
        quiz.add(Question(question: questionl, options: optionsl));
      }
      return quiz;
    } else {
      print(response.statusCode);
    }
  }
}
