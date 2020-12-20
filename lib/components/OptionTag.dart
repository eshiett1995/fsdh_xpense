import 'package:flutter/material.dart';
import 'package:fsdh_xpense/utilities/Constants.dart';

class OptionTag extends StatelessWidget {
  final String text;
  final String imageAsset;
  final EdgeInsetsGeometry margin;
  final Color textColor;
  final bool selected;
  final Function onTap;

  OptionTag({this.text, this.margin, this.textColor, this.imageAsset, this.selected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(this.onTap != null) this.onTap();
      },
      child: Container(
        margin: this.margin != null ? this.margin : EdgeInsets.all(0),
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          color: this.selected ? Constants.secondaryColor : Constants.greyishBlueColor,
          borderRadius: BorderRadius.circular(10),
        ),
        constraints: BoxConstraints(
            minHeight: 35, maxHeight: 35, minWidth: 100),
        child: imageAsset == null ?
                    Center(child: Text(this.text, style: TextStyle(color: this.textColor == null ? Constants.whiteColor: this.textColor, fontSize: 15.0),))
            :
            Row(
              children: [
                Image.asset(this.imageAsset, width: 15,),
                SizedBox(width: 12.5,),
                Text(this.text, style: TextStyle(color: this.textColor == null ? Constants.whiteColor: this.textColor, fontSize: 15.0),)
              ],
            )
      ),
    );
  }
}