part of 'advertising_today_cubit.dart';

@immutable
abstract class AdvertisingTodayState {}

class AdvertisingTodayInitial extends AdvertisingTodayState {}

class AdvertisingTodayLoading extends AdvertisingTodayState {}

class AdvertisingTodaySuccess extends AdvertisingTodayState {
  final List<AdvertisingModel> ads;

  AdvertisingTodaySuccess(this.ads);
}

class AdvertisingTodayFailure extends AdvertisingTodayState {
  final String errMessage;

  AdvertisingTodayFailure(this.errMessage);
}
