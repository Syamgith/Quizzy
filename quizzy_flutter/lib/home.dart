import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Color(0xffE41D15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Quizzy',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 80.0,
                    color: Colors.white,
                    shadows: [
                      Shadow(offset: Offset(9.0, 1.0), color: Colors.black)
                    ]),
              ),
            ),
            Text(
              "It's quiz time!!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 120.0),
            Container(
              color: Colors.black,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side: BorderSide(color: Colors.white),
                  ),
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Text(
                    'Play',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
