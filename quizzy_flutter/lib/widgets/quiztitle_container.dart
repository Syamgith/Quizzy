import 'package:flutter/material.dart';

class QuizTitleContainer extends StatelessWidget {
  QuizTitleContainer({this.title, this.subtitle = ''});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        //padding: EdgeInsets.only(top: 100),
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(200),
            bottomLeft: Radius.circular(200),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
