import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_app/gender_selec_widget.dart';
// import 'package:flutter/widgets.dart';

class BmiCalScreen extends StatefulWidget {
  const BmiCalScreen({super.key});

  @override
  State<BmiCalScreen> createState() => _BmiCalScreenState();
}

class _BmiCalScreenState extends State<BmiCalScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI Calculator',
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        backgroundColor: backgroundColor,
      ),
      body: Column(
        children: [
          Row(
            children: [
              GenderSelectionWidget(
                width: width,
                isMale: true,
              ),
              GenderSelectionWidget(width: width, isMale: false),
            ],
          ),
        ],
      ),
    );
  }
}
