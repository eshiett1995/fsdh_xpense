import 'package:flutter/material.dart';
import 'package:fsdh_xpense/utilities/Constants.dart';

import 'CustomButton.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, buttonText, cancelText;
  final String icon;
  final Color color;
  final Function onConfirm;
  final Function onCancel;

  const CustomDialogBox(
      {Key key, this.title, this.descriptions, this.buttonText, this.icon, this.color, this.onConfirm, this.cancelText, this.onCancel})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 23),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Constants.greyishBlueColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 23),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: widget.color,
                borderRadius: BorderRadius.circular(30),),
            child: new Image.asset(
              widget.icon,
              height: 35.0,
              width: 35.0,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            widget.title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Constants.whiteColor),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.descriptions,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Constants.whiteColor,
                height: 1.5),
            textAlign: TextAlign.center,
          ),
          CustomButton(
            data: widget.buttonText,
            color: Constants.secondaryColor,
            textColor: Constants.whiteColor,
            onPressed: () {
              if(widget.onConfirm != null){
                widget.onConfirm();
              }
              Navigator.of(context).pop();
            },
          ),
          SizedBox(height: 15,),
          Visibility(
            visible: widget.cancelText != null,
            child: CustomButton(
            data: widget.cancelText,
            color: Constants.secondaryColor,
            textColor: Constants.whiteColor,
            onPressed: () {
              if(widget.onCancel != null){
                widget.onCancel();
              }
              Navigator.of(context).pop();
            },
          ),)
        ],
      ),
    );
  }
}
