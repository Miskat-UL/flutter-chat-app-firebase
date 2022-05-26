import 'package:flutter/material.dart';




class WorkButtons extends StatelessWidget {
  WorkButtons({this.color, this.text, this.onTap});

  final Color color;
  final Function onTap;
  final Text text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        // color: Colors.lightBlueAccent,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onTap,
          minWidth: 200.0,
          height: 42.0,
          child: text,
        ),
      ),
    );
  }
}