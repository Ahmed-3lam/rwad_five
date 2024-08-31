part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeBannerLoading extends HomeState {}

final class HomeBannerSuccess extends HomeState {}

final class HomeBannerError extends HomeState {
  final String msg;
  HomeBannerError(this.msg);
}

final class HomeProductLoading extends HomeState {}

final class HomeProductSuccess extends HomeState {}

final class HomeProductError extends HomeState {
  final String msg;
  HomeProductError(this.msg);
}
