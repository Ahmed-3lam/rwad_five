import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rwad/dummy_projects/bmi_calc/cubit/bmi_cubit.dart';

enum Gender {
  MALE,
  FEMALE,
}

class BmiCalcScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BmiCubit>();
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
            BlocBuilder<BmiCubit, BmiState>(
              builder: (context, state) {
                return Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        _genderItem(
                          "MALE",
                          isSelected: cubit.selectedGender == Gender.MALE,
                          onTap: () {
                            cubit.changeGender(Gender.MALE);
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        _genderItem(
                          "FEMALE",
                          isSelected: cubit.selectedGender == Gender.FEMALE,
                          onTap: () {
                            cubit.changeGender(Gender.FEMALE);
                          },
                        ),
                      ],
                    ));
              },
            ),
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
                        BlocBuilder<BmiCubit, BmiState>(
                          builder: (context, state) {
                            return Text(
                              cubit.selectedHeight.toStringAsFixed(0),
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            );
                          },
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
                    BlocBuilder<BmiCubit, BmiState>(
                      builder: (context, state) {
                        return Slider(
                          min: 100,
                          max: 220,
                          value: cubit.selectedHeight,
                          onChanged: (val) {
                            cubit.changeHeight(val);
                          },
                          activeColor: Colors.red,
                        );
                      },
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
                      cubit,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    _buildItemThree(
                      "Age",
                      cubit,
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                double bmi =
                    cubit.selectedWeight / ((cubit.selectedHeight / 100) * 2);
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemThree(
    String text,
    BmiCubit cubit,
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
            BlocBuilder<BmiCubit, BmiState>(
              builder: (context, state) {
                return Text(
                  text == "Weight"
                      ? cubit.selectedWeight.toString()
                      : cubit.selectedAge.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
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
                    cubit.minWeightOrAge(text);
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
                    cubit.plusWeightOrAge(text);
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

// MVVM
// MODEL VIEW - VIEW -MODEL
