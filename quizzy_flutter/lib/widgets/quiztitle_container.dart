import 'package:flutter/material.dart';

class QuizTitleContainer extends StatelessWidget {
  QuizTitleContainer({this.title, this.subtitle = '', this.correct});
  final String title;
  final String subtitle;
  final bool correct;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 75, vertical: 5.0),
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(200),
            bottomLeft: Radius.circular(200),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60.0,
                color: Colors.black,
              ),
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: correct != null
                  ? BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    )
                  : null,
              child: correct == null
                  ? null
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          correct ? 'Correct' : 'Wrong',
                          style: TextStyle(
                              color: correct ? Colors.green : Colors.red,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          correct ? Icons.check : Icons.close,
                          color: correct ? Colors.green : Colors.red,
                          size: 25.0,
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
