import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fsdh_xpense/components/BankCard.dart';
import 'package:fsdh_xpense/components/BudgetedItem.dart';
import 'package:fsdh_xpense/models/Account.dart';
import 'package:fsdh_xpense/models/Budget.dart';
import 'package:fsdh_xpense/utilities/Constants.dart';
import 'package:fsdh_xpense/view/CreateBudgetScreen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class MyBudgetScreen extends StatefulWidget {
  final Account account;


  MyBudgetScreen(this.account);

  @override
  _MyBudgetScreenState createState() => _MyBudgetScreenState();
}

class _MyBudgetScreenState extends State<MyBudgetScreen> {
  Account account;


  @override
  void initState() {
    super.initState();
    account = widget.account;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(
        title: Text("My budget",),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:  ValueListenableBuilder(
          valueListenable: Hive.box<Budget>("budgets").listenable(),
          builder:(builder, Box<Budget> box, widget){
            return Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  BankCard(account: this.account,),
                  SizedBox(height: 20,),
                  Expanded(
                    child: ListView.builder(
                        itemCount: box.values.length,
                        itemBuilder: (BuildContext context,int index){
                          return BudgetedItem(budget: box.values.elementAt(index),);
                        }
                    ),
                  )
                ],
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.add),
        backgroundColor: Constants.secondaryColor,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateBudgetScreen()));
        },
      ),
    );
  }

}
