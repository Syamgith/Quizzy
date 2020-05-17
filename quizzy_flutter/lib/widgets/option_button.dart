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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        option,
        style: TextStyle(
          fontSize: 22,
          color: Colors.black,
        ),
      ),
      onPressed: () {
        onPress(isTrue, id);
      },
    );
  }
}
