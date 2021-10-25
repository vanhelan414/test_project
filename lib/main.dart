import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() {
  runApp(BMICalc());
}

class BMICalc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0D22),
        scaffoldBackgroundColor: Color(0xFF0A0D22),
      ),
      // routes: {
      //   '/': (context) => InputPage(),
      //   '/second': (context) => ResultPage(),
      // },
      home: InputPage(),
    );
  }
}
