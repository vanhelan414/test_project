import '../components/bottom_button.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_card.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.resultHeading,
      @required this.resultValue,
      @required this.resultMessage});
  final String resultHeading;
  final String resultValue;
  final String resultNormalRange = " 18.5-24.9 kg/m2";
  final String resultMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(
          child: Text("BMI Calculator"),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
              child: Text(
                "Your Result",
                style: kNumberTextStyle.copyWith(
                    fontSize: 30.0, fontWeight: FontWeight.w700),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: CreateTile(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultHeading,
                    style: kResultTitleStyle,
                  ),
                  Text(
                    resultValue,
                    style: kNumberTextStyle,
                  ),
                  Text(
                    "Normal BMI range :",
                    style: kLabelTextStyle,
                  ),
                  Text(
                    resultNormalRange,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    resultMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              colour: kActiveCardColor,
            ),
          ),
          BottomButton(
              buttonTitle: "RE-CALCULATE YOUR BMI",
              onPress: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
