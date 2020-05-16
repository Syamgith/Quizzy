import 'package:flutter/material.dart';
import 'package:quizzy_flutter/widgets/option_button.dart';
import 'package:quizzy_flutter/widgets/quiztitle_container.dart';

class PlayScreen extends StatefulWidget {
  PlayScreen({Key key}) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          QuizTitleContainer(
            title: '1',
            subtitle:
                'First programming language? jfk ksfsf dkjfjskfkjs kjsdfjksd',
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 40, right: 40, left: 40, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  OptionButton('option 1'),
                  OptionButton('Option 2'),
                  OptionButton('option 3'),
                  OptionButton('Option 4'),
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
