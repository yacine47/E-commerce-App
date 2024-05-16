import 'package:ecommerce_app/core/widgets/custom_failure_widget.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_widget.dart';
import 'package:ecommerce_app/core/widgets/custom_photo_profile.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/view_models/user_information_cubit/user_information_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key, this.photo = 'assets/images/prfil_avatar.png'});
  final String photo;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .3,
      color: MyColors.primaryColor,
      // color: Colors.black,
      child: BlocBuilder<UserInformationCubit, UserInformationState>(
        builder: (context, state) {
          if (state is UserInformationSuccess) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPhotoProfile(
                  size: 64,
                  photo: state.userModel.photoProfile!,
                ),
                const SizedBox(height: 16),
                Text('${state.userModel.firstName} ${state.userModel.lastName}',
                    style: Styles.style18.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )),
              ],
            );
          } else if (state is UserInformationFailure) {
            return CustomFailureWidget(errMessage: state.errMessage);
          }
          return const CustomLoadingWidget(color: Colors.white);
        },
      ),
    );
  }
}
// Image.asset(
            //   photo,
            //   alignment: const Alignment(0, .6),
            //   fit: BoxFit.cover,
            // ),