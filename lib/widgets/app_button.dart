import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  bool showProgress;

  AppButton(this.text, {this.onPressed, this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: showProgress
          ? Center(
              child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.white,
              ),
            ))
          : Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
      color: Colors.blue,
      onPressed: onPressed,
    );
  }
}
