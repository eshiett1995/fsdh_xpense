import 'package:flutter/material.dart';
import 'package:fsdh_xpense/utilities/Constants.dart';

class CustomTextField extends StatelessWidget {

  final String label;
  final TextEditingController controller;
  final Key key;

  CustomTextField({this.label, this.controller, this.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(this.label, style: TextStyle(color: Constants.ashColor, fontSize: 15, fontWeight: FontWeight.w600),)),
          SizedBox(height: 10,),
          TextFormField(
            style: TextStyle(color: Constants.whiteColor),
            validator: (value){
              if (value.isEmpty) {
                return '$label cannot be empty';
              }
              return null;
            },
            obscureText: this.label.toLowerCase().contains("password") ? true : false,
            controller: this.controller,
            cursorColor: Constants.secondaryColor,
            decoration: new InputDecoration(
              fillColor: Constants.greyishBlueColor,
              filled: true,
              contentPadding: EdgeInsets.only(left: 15),
              border: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Constants.secondaryColor, width: 2.0),
                borderRadius: BorderRadius.circular(12.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent, width: 2.0),
                borderRadius: BorderRadius.circular(12.0),
              ),
              errorStyle: TextStyle(color: Constants.secondaryColor),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent, width: 2.0),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
