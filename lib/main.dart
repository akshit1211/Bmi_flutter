import 'package:bmi_app/bmi_cal_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Bmi());
}

class Bmi extends StatelessWidget {
  const Bmi({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BmiCalScreen(),
    );
  }
}
