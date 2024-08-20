import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../bmi_calc_screen.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());

  Gender selectedGender = Gender.MALE;
  double selectedHeight = 180;
  int selectedWeight = 0;
  int selectedAge = 0;

  void changeGender(Gender gender) {
    selectedGender = gender;
    emit(BmiGenderChangedState());
  }

  void changeHeight(double height) {
    selectedHeight = height;
    emit(BmiHeightChangedState());
  }

  void minWeightOrAge(String text) {
    if (text == "Weight") {
      selectedWeight--;
    } else {
      selectedAge--;
    }
    emit(BmiWeightChangedState());
  }

  void plusWeightOrAge(String text) {
    if (text == "Weight") {
      selectedWeight++;
    } else {
      selectedAge++;
    }
    emit(BmiWeightChangedState());
  }
}
