import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/client_features/home/data/models/advertising_model.dart';
import 'package:ecommerce_app/features/client_features/home/data/repos/home_client_repo.dart';
import 'package:meta/meta.dart';

part 'advertising_details_state.dart';

class AdvertisingDetailsCubit extends Cubit<AdvertisingDetailsState> {
  AdvertisingDetailsCubit(this.homeClientRepo)
      : super(AdvertisingDetailsInitial());

  final HomeClientRepo homeClientRepo;

  Future<void> getAdsToday(int id) async {
    emit(AdvertisingDetailsLoading());
    var result = await homeClientRepo.getAdsDetails(id);

    result.fold(
      (failure) => emit(AdvertisingDetailsFailure(failure.error)),
      (ads) => emit(AdvertisingDetailsSuccess(ads)),
    );
  }
}
