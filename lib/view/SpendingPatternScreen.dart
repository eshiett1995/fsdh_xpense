import 'package:flutter/material.dart';
import 'package:fsdh_xpense/components/SpendingPatternItem.dart';
import 'package:fsdh_xpense/utilities/Constants.dart';

class SpendingPatternScreen extends StatefulWidget {
  @override
  _SpendingPatternScreenState createState() => _SpendingPatternScreenState();
}

class _SpendingPatternScreenState extends State<SpendingPatternScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(
        title: Text("Spending pattern",),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
                child: Image.network(
                    "https://quickchart.io/chart?c={type:'pie',data:{labels:['Food','School', 'Movies','Church', 'Sport'], datasets:[{data:[50,60,70,180,190]}]}}",
                  width: double.infinity,
                    loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: 115,
                        width: 115,
                        child: Center(
                            child: Column(
                              children: [
                                Text("Loading Bar chart....", style: TextStyle(color: Constants.whiteColor, fontSize: 18),),
                                CircularProgressIndicator(),
                              ],
                            )
                        ),
                      );
                    }
                ),
            ),
            SizedBox(height: 15,),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Transaction", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Constants.whiteColor),),
                      DropdownButton<String>(
                        dropdownColor: Constants.greyishBlueColor,
                        value: "30 days",
                        items: <String>['30 days', '60 days', '90 days'].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value, style: TextStyle(fontWeight: FontWeight.bold, color: Constants.whiteColor)),
                          );
                        }).toList(),
                        onChanged: (_) {
                          setState(() {

                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  SpendingPatternItem(),
                  SpendingPatternItem(),
                  SpendingPatternItem(),
                  SpendingPatternItem(),
                  SpendingPatternItem(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
