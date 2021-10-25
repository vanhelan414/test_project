import 'dart:math';

class BMIBrain {
  final int height;
  final int weight;

  BMIBrain({this.height, this.weight});
  double _bmi;
  String _resultMessage;

  String getResultValue() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResultHeading() {
    if (_bmi >= 25) {
      _resultMessage =
          "You have a higher than normal body weight. Try to exercise more.";
      return "Overweight";
    } else if (_bmi >= 18.5) {
      _resultMessage = "You have a normal body weight. Good job!";
      return "Normal";
    } else {
      _resultMessage =
          "You have a lower than normal body weight. you can eat a bit more.";
      return "Underweight";
    }
  }

  String getResultMessage() {
    return _resultMessage;
  }
}
