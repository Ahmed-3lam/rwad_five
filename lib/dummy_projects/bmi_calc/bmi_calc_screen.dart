import 'package:flutter/material.dart';

enum Gender {
  MALE,
  FEMALE,
}

class BmiCalcScreen extends StatefulWidget {
  const BmiCalcScreen({super.key});

  @override
  State<BmiCalcScreen> createState() => _BmiCalcScreenState();
}

class _BmiCalcScreenState extends State<BmiCalcScreen> {
  Gender selectedGender = Gender.MALE;
  double selectedHeight = 180;
  int selectedWeight = 0;
  int selectedAge = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C1232),
      appBar: AppBar(
        backgroundColor: Color(0xFF0C1232),
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Row(
                  children: [
                    _genderItem(
                      "MALE",
                      isSelected: selectedGender == Gender.MALE,
                      onTap: () {
                        selectedGender = Gender.MALE;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    _genderItem(
                      "FEMALE",
                      isSelected: selectedGender == Gender.FEMALE,
                      onTap: () {
                        selectedGender = Gender.FEMALE;
                        setState(
                          () {},
                        );
                      },
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: _boxDecoration(),
                child: Column(
                  children: [
                    Text(
                      "HEIGHT",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          selectedHeight.toStringAsFixed(0),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "CM",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      min: 100,
                      max: 220,
                      value: selectedHeight,
                      onChanged: (val) {
                        selectedHeight = val;
                        setState(() {});
                      },
                      activeColor: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                flex: 5,
                child: Row(
                  children: [
                    _buildItemThree(
                      "Weight",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    _buildItemThree(
                      "Age",
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                double bmi = selectedWeight / ((selectedHeight / 100) * 2);
                String message;
                if (bmi < 18.5) {
                  message = 'Underweight';
                } else if (bmi >= 18.5 && bmi < 24.9) {
                  message = 'Normal';
                } else if (bmi >= 25 && bmi < 29.9) {
                  message = 'Overweight';
                } else {
                  message = 'Obese';
                }

                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(message),
                        content: Text("Your BMI is ${bmi.toInt()}"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("OK"),
                          )
                        ],
                      );
                    });
              },
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Check your BMI",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded _buildItemThree(
    String text,
  ) {
    return Expanded(
      child: Container(
        decoration: _boxDecoration(),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text == "Weight"
                  ? selectedWeight.toString()
                  : selectedAge.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  shape: CircleBorder(),
                  mini: true,
                  onPressed: () {
                    if (text == "Weight") {
                      selectedWeight--;
                    } else {
                      selectedAge--;
                    }
                    setState(() {});
                  },
                  child: Icon(Icons.remove),
                ),
                SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  shape: CircleBorder(),
                  mini: true,
                  onPressed: () {
                    if (text == "Weight") {
                      selectedWeight++;
                    } else {
                      selectedAge++;
                    }
                    setState(() {});
                  },
                  child: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _genderItem(
    String text, {
    required bool isSelected,
    void Function()? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 30),
          )),
          decoration: _boxDecoration(
              color: isSelected ? Colors.red.withOpacity(.2) : null),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration({Color? color}) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color != null ? color : Color(0xFF252948));
  }
}
