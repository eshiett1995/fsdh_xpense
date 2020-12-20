import 'package:flutter/material.dart';
import 'package:fsdh_xpense/utilities/Constants.dart';

import 'DualRingSpinner.dart';

class CustomButton extends StatelessWidget {
  final String data;
  final Color color;
  final Color textColor;
  final Function onPressed;
  final bool isLoading;

  CustomButton(
      {this.data, this.color, this.textColor, this.onPressed, this.isLoading = false });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        color: this.color,
        disabledColor: Constants.pink65,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0)),
        onPressed: this.onPressed == null ? null :() => onPressed(),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            constraints: BoxConstraints(maxHeight: 45, minHeight: 45),
            width: double.infinity,
            child: this.isLoading ?  DualRingSpinner()
                :
             Center(
                    child: Text(
                    this.data,
                    style: TextStyle(fontSize: 20, color: this.textColor),
                  ))));
  }
}