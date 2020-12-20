import 'package:flutter/material.dart';
import 'package:fsdh_xpense/components/CustomButton.dart';
import 'package:fsdh_xpense/components/CustomTextField.dart';
import 'package:fsdh_xpense/components/OptionTag.dart';
import 'package:fsdh_xpense/models/Account.dart';
import 'package:fsdh_xpense/models/Budget.dart';
import 'package:fsdh_xpense/utilities/Constants.dart';
import 'package:hive/hive.dart';

class CreateBudgetScreen extends StatefulWidget {
  @override
  _CreateBudgetScreenState createState() => _CreateBudgetScreenState();
}

class _CreateBudgetScreenState extends State<CreateBudgetScreen> {
  Budget budget;

  TextEditingController name = TextEditingController();
  double amount = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 23, right: 23, bottom: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Create a budget",
                  style: TextStyle(
                      color: Constants.whiteColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 22,
            ),
            CustomTextField(
              label: "Name",
              controller: name,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Price",
                  style: TextStyle(
                    color: Constants.ashColor,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "Range ₦0 - ₦100,000",
                  style: TextStyle(
                    color: Constants.secondaryColor,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Constants.greyishBlueColor,
                  borderRadius: BorderRadius.circular(10)),
              child: SliderTheme(
                data: SliderThemeData(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13)),
                child: Slider(
                  min: 0,
                  max: 100000,
                  value: amount,
                  inactiveColor: Constants.primaryColor,
                  activeColor: Constants.secondaryColor,
                  onChanged: (value) => setState(() {
                    amount = value;
                  }),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Dates",
              style: TextStyle(
                color: Constants.ashColor,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                OptionTag(
                  text: "This week",
                  margin: EdgeInsets.only(right: 10),
                ),
                OptionTag(
                  text: "This month",
                  margin: EdgeInsets.only(right: 10),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(child: SizedBox()),
            CustomButton(
              data: "Save budget",
              color: Constants.secondaryColor,
              textColor: Constants.whiteColor,
              onPressed: () {
                var budgetBox = Hive.box<Budget>("budgets");
                budget = new Budget(
                  id: budgetBox.values.length + 1,
                  name: name.value.text,
                  amount: amount,
                  period: "once",
                  time: DateTime.now().millisecondsSinceEpoch,
                  remaining: amount,
                );

                budgetBox.put(budgetBox.values.length + 1, budget);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}

class CustomRangeThumb extends RangeSliderThumbShape {
  static const double _thumbSize = 10.0;
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(_thumbSize);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {Animation<double> activationAnimation,
      Animation<double> enableAnimation,
      bool isDiscrete,
      bool isEnabled,
      bool isOnTop,
      TextDirection textDirection,
      SliderThemeData sliderTheme,
      Thumb thumb,
      bool isPressed}) {
    final Canvas canvas = context.canvas;

    canvas.drawCircle(Offset(center.dx, center.dy), 13,
        Paint()..color = Constants.secondaryColor);
    canvas.drawCircle(
        Offset(center.dx, center.dy), 9, Paint()..color = Constants.whiteColor);
  }
}
