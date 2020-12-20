import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fsdh_xpense/components/BankCard.dart';
import 'package:fsdh_xpense/components/CustomDialogBox.dart';
import 'package:fsdh_xpense/utilities/Constants.dart';
import 'package:fsdh_xpense/view/CreateBudgetScreen.dart';
import 'package:fsdh_xpense/view/MyExpensesScreen.dart';
import 'package:fsdh_xpense/view/SpendingPatternScreen.dart';

class MyBudgetScreen extends StatefulWidget {
  @override
  _MyBudgetScreenState createState() => _MyBudgetScreenState();
}

class _MyBudgetScreenState extends State<MyBudgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(
        title: Text("My budget",),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _displayBanksConnected(context),
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

  Widget _noBanksConnected(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("You have no connected account", style: TextStyle(color: Constants.whiteColor),),

        ],),
    );
  }

  Widget _displayBanksConnected(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          BankCard(),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context,int index){
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
                            backgroundImage: NetworkImage("https://miro.medium.com/max/4000/1*dapNzEzbJ-dgIloET3h8xA.jpeg"),
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
                                  Text("Electricity", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Constants.ashColor),),
                                   Text("N2,000 left", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Constants.ashColor),)
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("N3,000", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Constants.ashColor),),
                                    Text("12:55", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Constants.ashColor),)
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
            ),
          )
        ],
      ),
    );
  }

  void _modalBottomSheetMenu(BuildContext context){
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
                  Text("Plan a budget", style: TextStyle( fontSize: 20,fontWeight: FontWeight.bold, color: Constants.whiteColor),),
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
                  Text("Remove account", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Constants.whiteColor),),
                ],
              ),
            ),
          );
        }
    );
  }
}
