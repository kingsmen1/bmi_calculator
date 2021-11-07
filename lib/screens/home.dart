import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightcontroller = TextEditingController();
  TextEditingController _Weightcontroller = TextEditingController();
  double BgmiResult = 0;
  String TextResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainHexColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: accentHexColor,
            fontWeight: FontWeight.w300,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightcontroller,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8)),
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _Weightcontroller,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 42,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Weight',
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightcontroller.text);
                double _w = double.parse(_Weightcontroller.text);
                setState(() {
                  BgmiResult = _w / (_h * _h);
                  if (BgmiResult > 25) {
                    TextResult = "You\'re over weight";
                  } else if (BgmiResult >= 18.5 && BgmiResult <= 25) {
                    TextResult = "You have normal weight";
                  } else {
                    TextResult = "You\'re under weight";
                  }
                });
              },
              child: Container(
                child: Text(
                  'Calculate',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor),
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              child: Text(BgmiResult.toString(),
                style: TextStyle(fontSize: 90, color: accentHexColor),
              ),
            ),
            SizedBox(height: 30),
            Visibility(
              visible: TextResult.isNotEmpty,
              child: Container(
                child: Text(TextResult,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 32,
                        color: accentHexColor)),
              ),
            ),
            SizedBox(height: 40),
            RightBar(barWidth: 35),
            SizedBox(height: 20),
            RightBar(barWidth: 75),
            SizedBox(height: 20),
            RightBar(barWidth: 35),
            SizedBox(height: 40),
            LeftBar(barWidth: 35),
            SizedBox(height: 20),
            LeftBar(barWidth: 75),
            SizedBox(height: 20),
            LeftBar(barWidth: 35)
          ],
        ),
      ),
    );
  }
}
