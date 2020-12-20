import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fsdh_xpense/components/BankCard.dart';
import 'package:fsdh_xpense/components/CustomDialogBox.dart';
import 'package:fsdh_xpense/models/Account.dart';
import 'package:fsdh_xpense/utilities/Constants.dart';
import 'package:fsdh_xpense/view/MyExpensesScreen.dart';
import 'package:fsdh_xpense/view/SpendingPatternScreen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'MyBudget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(
        title: Text("All connected accounts",),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ValueListenableBuilder(
          valueListenable: Hive.box<Account>("accounts").listenable(),
          builder:(builder, Box<Account> box, widget){
            return box.values.length == 0 ? _noBanksConnected() : _displayBanksConnected(context, box);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.add),
        backgroundColor: Constants.secondaryColor,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialogBox(
                  icon: "assets/images/bell-ring.png",
                  title: "Choose a provider",
                  descriptions:
                  "A provider helps you connect\nyour banking bank accounts seamlessly\nwith us\n",
                  buttonText: "Connect with Okra",
                  onConfirm: (){},
                  cancelText: "Automatically Generate",
                  onCancel: () async{
                       print("hehe");
                       String jsonString = await rootBundle.loadString("assets/json/accounts.json");
                       final jsonResponse = jsonDecode(jsonString);
                       var accountsJson = jsonResponse["accounts"] as List;
                       List<Account> accounts = accountsJson.map((i) => Account.fromJson(i)).toList();
                       var accountBox = Hive.box<Account>("accounts");
                       Account account = accounts.elementAt(accountBox.values.length)..selected = true;
                       accountBox.put(account.id, account);
                  },
                  color: Constants.secondaryColor,
                );
              });
        },
      ),
    );
  }

  Widget _noBanksConnected(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("You have no connected account", style: TextStyle(color: Constants.whiteColor),),

        ],),
    );
  }

  Widget _displayBanksConnected(BuildContext context, Box<Account> box){
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: ListView.builder(
          itemCount: box.values.length,
          itemBuilder: (BuildContext context,int index){
            Account account = box.values.elementAt(index);
            return BankCard(onTap: () =>_modalBottomSheetMenu(context, account), account: account);
          }
      ),
    );
  }

  void _modalBottomSheetMenu(BuildContext context, Account account){
    showModalBottomSheet(
        context: context,
        shape : RoundedRectangleBorder(
            borderRadius : BorderRadius.circular(20)
        ),
        builder: (builder){
          return new Container(
            height: 250.0,
            color: Constants.navyBlueDarkish, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
              padding: EdgeInsets.only(bottom: 30, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyBudgetScreen()));
                      },
                      child: Text("Plan a budget", style: TextStyle( fontSize: 20,fontWeight: FontWeight.bold, color: Constants.whiteColor),)),
                  GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyExpensesScreen()));
                      },
                      child: Text("My expenses", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Constants.whiteColor),)),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SpendingPatternScreen()));
                    },
                      child: Text("View spending pattern", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Constants.whiteColor),)),
                  GestureDetector(
                    onTap: (){
                      account.delete();
                    },
                      child: Text("Remove account", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Constants.whiteColor),)),
                ],
              ),
            ),
          );
        }
    );
  }
}
