import 'package:flutter/material.dart';
import 'package:quizzy_flutter/screens/play_screen.dart';
import 'package:quizzy_flutter/widgets/title_container.dart';

class Rules extends StatelessWidget {
  const Rules({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleContainer(title: 'Rules'),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Must attempt all quiestions.',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    'For each correct answer 10 points.',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    'For each wrong answer -5 points.',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                        color: Colors.pink,
                      ),
                    ),
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: Text(
                      'Start',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlayScreen(),
                        ),
                      );
                    },
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
