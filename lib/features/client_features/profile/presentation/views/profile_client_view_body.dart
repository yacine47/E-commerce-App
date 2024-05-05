import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/custom_profil_items.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/login_view.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/view_models/logout_cubit/logout_cubit.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/view_models/user_information_cubit/user_information_cubit.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/views/edit_profile_view.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/views/order_client_view.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/views/widgets/profile_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileClientViewBody extends StatefulWidget {
  const ProfileClientViewBody({super.key});

  @override
  State<ProfileClientViewBody> createState() => _ProfileClientViewBodyState();
}

class _ProfileClientViewBodyState extends State<ProfileClientViewBody> {
  @override
  void initState() {
    BlocProvider.of<UserInformationCubit>(context).getInformationUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileInfo(),
        const SizedBox(height: 58),
        CustomProfielItems(
          onTap: () {
            GoRouter.of(context).push(EditProfileView.path);
          },
          title: 'Edit Profile',
          subTitle: 'Update and modify your profile',
          icon: kEditIcon,
        ),
        const SizedBox(height: 12),
        CustomProfielItems(
          onTap: () {
            GoRouter.of(context).push(OrderClientView.path);
          },
          title: 'My Orders',
          subTitle: 'See your orders',
          icon: kOrderIcon,
        ),
        const SizedBox(height: 12),
        BlocListener<LogoutCubit, LogoutState>(
          listener: (context, state) {
            if (state is LogoutSuccess) {
              GoRouter.of(context).pushReplacement(LoginView.path);
            }
          },
          child: CustomProfielItems(
            onTap: () {
              BlocProvider.of<LogoutCubit>(context).logout();
            },
            title: 'Log Out',
            subTitle: 'Sign in into another account',
            icon: kLogoutIcon,
          ),
        ),
      ],
    );
  }
}
