import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_assets.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_failure_widget.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_widget.dart';
import 'package:ecommerce_app/core/widgets/custom_photo_profile.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/advertising_deatils_cubit/advertising_details_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/go_back_button_back_ligh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomStoreSellerProfile extends StatelessWidget {
  const CustomStoreSellerProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .24,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Image.asset(
            MyAssets.bachgroundBlack,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          BlocBuilder<AdvertisingDetailsCubit, AdvertisingDetailsState>(
            builder: (context, state) {
              if (state is AdvertisingDetailsSuccess) {
                return ItemHasPadding(
                  horPadding: kHorPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const SizedBox(height: 19),
                      const Spacer(flex: 1),
                      const GoBackButtonBackLight(),
                      const Spacer(flex: 2),
                      Row(
                        children: [
                          CustomPhotoProfile(
                              photo: state
                                  .ads.sellerModel!.userModel!.photoProfile!,
                              size: 52),
                          const SizedBox(width: 34),
                          Text(
                            '${state.ads.sellerModel!.userModel!.firstName} ${state.ads.sellerModel!.userModel!.lastName}',
                            style: Styles.style24.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                );
              } else if (state is AdvertisingDetailsFailure) {
                return CustomFailureWidget(errMessage: state.errMessage);
              }
              return const CustomLoadingWidget(color: Colors.white);
            },
          ),
        ],
      ),
    );
  }
}
