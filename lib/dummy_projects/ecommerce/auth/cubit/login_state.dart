part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final String msg;
  LoginSuccessState(this.msg);
}

final class LoginErrorState extends LoginState {
  final String msg;
  LoginErrorState(this.msg);
}
