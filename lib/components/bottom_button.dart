import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onPress;
  final String buttonTitle;
  BottomButton({@required this.buttonTitle, @required this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(child: Text(buttonTitle)),
        height: 50.0,
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
      ),
    );
  }
}
