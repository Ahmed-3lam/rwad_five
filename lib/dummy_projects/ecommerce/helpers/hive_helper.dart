import 'package:hive/hive.dart';

class HiveHelper {
  static const onboardingBox = "ONBOARDING_BOX";

  static void setValueInOnboardingBox() {
    Hive.box(onboardingBox).put(onboardingBox, true);
  }

  static bool checkOnBoardingValue() {
    if (Hive.box(onboardingBox).isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
