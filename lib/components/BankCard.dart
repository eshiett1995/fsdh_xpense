import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsdh_xpense/models/Account.dart';
import 'package:fsdh_xpense/utilities/Constants.dart';

class BankCard extends StatelessWidget {

  final Function onTap;
  final Account account;

  const BankCard({Key key, this.onTap, this.account}) : super(key: key);



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
            Text(this.account.bank, style: TextStyle(fontWeight: FontWeight.bold, color: Constants.whiteColor),),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(this.account.cardNumber, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Constants.whiteColor),)),
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
                        child: Text("N${this.account.balance}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Constants.whiteColor),)),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(this.account.expiry, style: TextStyle(fontWeight: FontWeight.w500, color: Constants.whiteColor),)),
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
