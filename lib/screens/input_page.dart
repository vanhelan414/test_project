import '../bmi_brain.dart';
import '../screens/result_page.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender; // will be null initially
  int height = 120;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("BMI Calculator"),
        ),
      ),
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, //for stretching the shrunk container
        children: <Widget>[
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: CreateTile(
                  colour: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInActiveCardColor,
                  cardChild: IconContent(
                    icon: Icons.face,
                    text: 'MALE',
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                ),
              ),
              Expanded(
                child: CreateTile(
                  colour: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInActiveCardColor,
                  cardChild: IconContent(
                    icon: Icons.face_retouching_natural,
                    text: 'FEMALE',
                  ),
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                ),
              ),
            ],
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CreateTile(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(height.round().toString(),
                                style: kNumberTextStyle),
                            Text(
                              "cm",
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: kSliderActiveColor,
                            inactiveTrackColor: kSliderInActiveColor,
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x1fEB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            onChanged: (double value) {
                              setState(() {
                                height = value.round();
                              });
                            },
                            min: 120.0,
                            max: 220.0,
                          ),
                        ),
                      ],
                    ),
                    colour: kInActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CreateTile(
                    colour: kInActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CreateTile(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kInActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: "CALCULATE YOUR BMI",
            onPress: () {
              BMIBrain bbrain = BMIBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    resultValue: bbrain.getResultValue(),
                    resultHeading: bbrain.getResultHeading(),
                    resultMessage: bbrain.getResultMessage(),
                  ),
                ),
              );
              //    Navigator.of(context).pushNamed('/second');
            },
          ),
        ],
      ),
    );
  }
}
