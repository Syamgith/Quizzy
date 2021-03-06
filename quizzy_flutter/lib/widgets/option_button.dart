import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  OptionButton({this.option, this.onPress, this.isTrue, this.colour, this.id});
  final String option;
  final bool isTrue;
  final Function onPress;
  final Color colour;
  final int id;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
          color: Colors.pink,
        ),
      ),
      color: colour,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
      child: Text(
        option,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      onPressed: () {
        onPress(isTrue, id);
      },
    );
  }
}
