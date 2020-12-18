import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsdh_xpense/utilities/Constants.dart';

class BankCard extends StatelessWidget {

  final Function onTap;

  const BankCard({Key key, this.onTap}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        this.onTap();
      },
      child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 15, left: 10, right: 10),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
                colors: [Colors.deepOrangeAccent, Colors.orangeAccent])
        ),

        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Gaurantee Trust Bank", style: TextStyle(fontWeight: FontWeight.bold, color: Constants.whiteColor),),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("5040 8094 4323 4984 4040", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Constants.whiteColor),)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Total Balance", style: TextStyle(fontWeight: FontWeight.bold,color: Constants.whiteColor),)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("N2,000,000", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Constants.whiteColor),)),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text("06/24", style: TextStyle(fontWeight: FontWeight.w500, color: Constants.whiteColor),)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
