import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class QuizTitleContainer extends StatelessWidget {
  QuizTitleContainer(
      {this.title, this.subtitle = '', this.correct, this.timer});
  final String title;
  final String subtitle;
  final bool correct;
  final int timer;
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
            correct == null && timer != null
                ? LinearPercentIndicator(
                    animation: true,
                    animationDuration: timer * 1000,
                    animateFromLastPercent: true,
                    lineHeight: 20.0,
                    percent: timer > 0 ? 1.0 : 0.0,
                    center: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          timer.toString(),
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.pink,
                          ),
                        ),
                        Icon(
                          Icons.timer,
                          color: Colors.pink,
                          size: 18,
                        ),
                      ],
                    ),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    backgroundColor: Colors.white,
                    progressColor: Colors.black,
                  )
                : Text('Points'),
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
