import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Quizzy'),
          SizedBox(height: 15.0),
          MaterialButton(
              color: Colors.red,
              child: Text(
                'Play',
                style: TextStyle(fontSize: 40),
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}
