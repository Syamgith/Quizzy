import 'package:flutter/material.dart';

class TitleContainer extends StatelessWidget {
  TitleContainer({this.title, this.subtitle = ''});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 100),
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
                  fontWeight: FontWeight.w700,
                  fontSize: 70.0,
                  color: Colors.white,
                  shadows: [
                    Shadow(offset: Offset(9.0, 1.0), color: Colors.black)
                  ]),
            ),
            SizedBox(height: 20.0),
            Text(
              subtitle,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
