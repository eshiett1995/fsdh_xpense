import 'package:flutter/material.dart';
import 'package:fsdh_xpense/models/Budget.dart';
import 'package:fsdh_xpense/utilities/Constants.dart';

class BudgetedItem extends StatelessWidget {
  final Budget budget;


  BudgetedItem({this.budget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25, left: 10, right: 10, ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.transparent, width: .5))
            ),
            child: CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage("https://webstockreview.net/images/save-money-icon-png-11.png"),
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Constants.greyishBlueColor, width: .5))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(this.budget.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Constants.ashColor),),
                      Text("N${this.budget.remaining.toInt()}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Constants.ashColor),)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("N${this.budget.amount.toInt()}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Constants.ashColor),),
                      Text(parseDate(this.budget.time), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Constants.ashColor),)
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String parseDate(int epochTime) {

    return "${DateTime.fromMillisecondsSinceEpoch(epochTime).day.toString()}-${DateTime.fromMillisecondsSinceEpoch(epochTime).month.toString()}-${DateTime.fromMillisecondsSinceEpoch(epochTime).year.toString()}";

  }
}
