import 'package:flutter/material.dart';
import 'package:fsdh_xpense/components/CustomButton.dart';
import 'package:fsdh_xpense/components/CustomTextField.dart';
import 'package:fsdh_xpense/components/OptionTag.dart';
import 'package:fsdh_xpense/utilities/Constants.dart';

class CreateBudgetScreen extends StatefulWidget {
  @override
  _CreateBudgetScreenState createState() => _CreateBudgetScreenState();
}

class _CreateBudgetScreenState extends State<CreateBudgetScreen> {
  RangeValues _values = RangeValues(1, 100000);
  TextEditingController searchTextEditController;
  bool showPreviousSearches = false;
  bool showSearchResults = false;
  var searchedStrings = ["Micheal Jackson", "A good time"];

  @override
  void initState() {
    super.initState();
    searchTextEditController = TextEditingController();
    searchTextEditController.addListener(() {
      if (searchTextEditController.text.isEmpty) {
        showPreviousSearches = true;
      } else {
        showSearchResults = true;
      }
      setState(() {});
    });
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
            CustomTextField(label: "Name", controller: TextEditingController(), ),
            SizedBox(height: 20,),
            CustomTextField(label: "Amount", controller: TextEditingController()),
            SizedBox(height: 40,),
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
                  "Range ₦${_values.start.toInt()} - ₦${_values.end.toInt()}",
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
                    rangeThumbShape: CustomRangeThumb(),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13)),
                child: RangeSlider(
                  min: 1,
                  max: 100000,
                  values: _values,
                  inactiveColor: Constants.primaryColor,
                  activeColor: Constants.secondaryColor,
                  onChanged: (values) => setState(() {
                    _values = values;
                  }),
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            CustomButton(
              data: "Save budget",
              color: Constants.secondaryColor,
              textColor: Constants.whiteColor,
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
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

    canvas.drawCircle(Offset(center.dx, center.dy), 13, Paint()..color = Constants.secondaryColor);
    canvas.drawCircle(Offset(center.dx, center.dy), 9, Paint()..color = Constants.whiteColor);
  }
}
