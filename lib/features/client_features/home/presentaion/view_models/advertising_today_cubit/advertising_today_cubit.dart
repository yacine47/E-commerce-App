import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/client_features/home/data/models/advertising_model.dart';
import 'package:ecommerce_app/features/client_features/home/data/repos/home_client_repo.dart';
import 'package:meta/meta.dart';

part 'advertising_today_state.dart';

class AdvertisingTodayCubit extends Cubit<AdvertisingTodayState> {
  AdvertisingTodayCubit(this.homeClientRepo) : super(AdvertisingTodayInitial());

    final HomeClientRepo homeClientRepo;


   Future<void> getAdsToday() async {
    emit(AdvertisingTodayLoading());
    var result = await homeClientRepo.getAdsToday();

    result.fold(
      (failure) => emit(AdvertisingTodayFailure(failure.error)),
      (advertisings) => emit(AdvertisingTodaySuccess(advertisings)),
    );
  }
}
