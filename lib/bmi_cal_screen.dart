// import 'package:bmi_app/GenderSelectionWidget.dart';
// import 'package:bmi_app/changebuttons.dart';
import 'package:bmi_app/bmi_res_screen.dart';
import 'package:bmi_app/change_buttons.dart';
import 'package:bmi_app/constants.dart';
import 'package:bmi_app/gender_selec_widget.dart';
import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BmiCalScreen extends StatefulWidget {
  const BmiCalScreen({Key? key}) : super(key: key);

  @override
  State<BmiCalScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BmiCalScreen> {
  bool isMale = true;
  int weight = 75;
  int age = 25;
  double height = 130;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        backgroundColor: backgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: GenderSelectionWidget(
                    width: width,
                    isMale: true,
                    backgroundColor: isMale ? cardColor : backgroundColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: GenderSelectionWidget(
                    width: width,
                    isMale: false,
                    backgroundColor: !isMale ? cardColor : backgroundColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Container(
              width: width,
              height: width * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: cardColor),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Height',
                      style: titleTextStyle,
                    ),
                    Text(
                      '${height.toInt()}',
                      style: titleTextStyle.copyWith(fontSize: 40),
                    ),
                    SliderTheme(
                      data: SliderThemeData().copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        thumbColor: Colors.pink,
                        overlayColor: Colors.pink.withOpacity(0.5),
                      ),
                      child: Slider(
                          min: 100,
                          max: 200,
                          value: height,
                          onChanged: (value) {
                            height = value;
                            setState(() {});
                          }),
                    )
                  ]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChangeButtons(
                  txt: "weight",
                  inc: weight,
                  width: width,
                  onAdd: () => addSubtractWeight(true),
                  onRemove: () => addSubtractWeight(false),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChangeButtons(
                  txt: "age",
                  inc: age,
                  width: width,
                  onAdd: () => addSubtractAge(true),
                  onRemove: () => addSubtractAge(false),
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              final bmi = weight / ((height / 100) * (height / 100));
              print(bmi);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => BmiResScreen(bmi: bmi)));
            },
            child: Container(
              width: width,
              // height: 80,
              color: Colors.pink,
              child: const Center(
                  child: Text(
                'Calculate BMI',
                style: titleTextStyle,
              )),
            ),
          )
        ],
      ),
    );
  }

  void addSubtractWeight(bool isAdd) {
    isAdd
        ? weight++
        : weight <= 0
            ? weight
            : weight--;
    setState(() {});
  }

  void addSubtractAge(bool isAdd) {
    isAdd
        ? age++
        : age <= 0
            ? age
            : age--;
    setState(() {});
  }
}
