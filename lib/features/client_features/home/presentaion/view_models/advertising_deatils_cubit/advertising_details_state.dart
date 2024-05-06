part of 'advertising_details_cubit.dart';

@immutable
abstract class AdvertisingDetailsState {}

class AdvertisingDetailsInitial extends AdvertisingDetailsState {}

class AdvertisingDetailsLoading extends AdvertisingDetailsState {}

class AdvertisingDetailsSuccess extends AdvertisingDetailsState {
  final AdvertisingModel ads;

  AdvertisingDetailsSuccess(this.ads);
}

class AdvertisingDetailsFailure extends AdvertisingDetailsState {
  final String errMessage;

  AdvertisingDetailsFailure(this.errMessage);
}
