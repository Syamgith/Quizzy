import 'dart:convert';

import 'package:http/http.dart' as http;

class QuestionsLib {
  List<Question> quiz;

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
    String question0 = data['Quiz Questions'][0]['Questions'];
    var options0 = data['Quiz Questions'][0]['Answers'][0]['Answers'];
    print(question0);
    print(options0);
  }
}

class Question {
  Question({this.question, this.options});
  String question;
  Map<String, bool> options;
}
