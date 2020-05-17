import 'package:flutter/material.dart';

class OptionButton extends StatefulWidget {
  OptionButton({this.option, this.onPress, this.isTrue});
  final String option;
  final bool isTrue;
  final Function onPress;

  @override
  _OptionButtonState createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  Color colour = Colors.white;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
          color: Colors.pink,
        ),
      ),
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        widget.option,
        style: TextStyle(
          fontSize: 22,
          color: Colors.black,
        ),
      ),
      onPressed: () {
        setState(() {
          colour = widget.isTrue ? Colors.green : Colors.red;
        });
        widget.onPress(widget.isTrue);
      },
    );
  }
}
