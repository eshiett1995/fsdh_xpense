import 'package:flutter/material.dart';
import 'package:fsdh_xpense/utilities/Constants.dart';

class SpendingPatternItem extends StatefulWidget {
  @override
  _SpendingPatternItemState createState() => _SpendingPatternItemState();
}

class _SpendingPatternItemState extends State<SpendingPatternItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                    child: Icon(Icons.home, color: Constants.whiteColor,),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Constants.secondaryColor,
                    borderRadius: BorderRadius.circular(3)
                  ),
                ),
                SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Electricity", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.whiteColor),),
                    Text("13 Jan, 08:45pm", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.whiteColor),),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Text("N2,000", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.whiteColor),),
          )
        ],
      ),
    );
  }
}
