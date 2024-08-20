part of 'bmi_cubit.dart';

@immutable
sealed class BmiState {}

final class BmiInitial extends BmiState {}

final class BmiGenderChangedState extends BmiState {}

final class BmiHeightChangedState extends BmiState {}

final class BmiWeightChangedState extends BmiState {}

final class BmiAgeChangedState extends BmiState {}
