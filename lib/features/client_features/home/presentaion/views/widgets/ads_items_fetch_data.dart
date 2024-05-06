import 'package:ecommerce_app/core/widgets/custom_failure_widget.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/advertising_today_cubit/advertising_today_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_ads.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_ads_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdsItemsFetchData extends StatelessWidget {
  const AdsItemsFetchData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvertisingTodayCubit, AdvertisingTodayState>(
      builder: (context, state) {
        if (state is AdvertisingTodaySuccess) {
          return CustomAds(
            advertisings: state.ads,
          );
        } else if (state is AdvertisingTodayFailure) {
          return CustomFailureWidget(
            errMessage: state.errMessage,
          );
        }
        return const CustomAdsLoadingWidget();
      },
    );
  }
}
