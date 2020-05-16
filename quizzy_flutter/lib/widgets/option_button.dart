import 'package:flutter/material.dart';
import 'package:quizzy_flutter/questions_lib.dart';

class OptionButton extends StatelessWidget {
  OptionButton(this.option);
  final String option;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
          color: Colors.pink,
        ),
      ),
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        option,
        style: TextStyle(
          fontSize: 22,
          color: Colors.black,
        ),
      ),
      onPressed: () {
        QuestionsLib().fetchingData();
      },
    );
  }
}
