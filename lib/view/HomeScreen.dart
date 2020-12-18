import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fsdh_xpense/components/BankCard.dart';
import 'package:fsdh_xpense/components/CustomDialogBox.dart';
import 'package:fsdh_xpense/utilities/Constants.dart';
import 'package:fsdh_xpense/view/SpendingPatternScreen.dart';

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
      body: _displayBanksConnected(context),
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
                  onCancel: (){

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

  Widget _displayBanksConnected(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context,int index){
            return BankCard(onTap: () =>_modalBottomSheetMenu(context));
          }
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
                  Text("View expenses", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Constants.whiteColor),),
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
