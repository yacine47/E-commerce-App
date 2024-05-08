import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/core/widgets/custom_failure_widget.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_widget.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/view_models/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/view_models/user_information_cubit/user_information_cubit.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/views/widgets/edit_information_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  @override
  void initState() {
    BlocProvider.of<UserInformationCubit>(context).getInformationUser();
    super.initState();
  }

  GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return ItemHasPadding(
      horPadding: kHorPadding,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            BlocBuilder<UserInformationCubit, UserInformationState>(
              builder: (context, state) {
                if (state is UserInformationSuccess) {
                  return EditInformationSuccess(
                    userModel: state.userModel,
                  );
                } else if (state is UserInformationFailure) {
                  return CustomFailureWidget(errMessage: state.errMessage);
                }
                return const CustomLoadingWidget();
              },
            ),
            ItemHasPadding(
                horPadding: MediaQuery.of(context).size.width * .1,
                child: BlocConsumer<EditProfileCubit, EditProfileState>(
                  listener: (context, state) {
                    if (state is EditProfileSuccess) {
                      BlocProvider.of<UserInformationCubit>(context)
                          .getInformationUser();
                      GoRouter.of(context).pop();
                    }
                  },
                  builder: (context, state) {
                    return CustomButtonSubmit(
                        isLoadingState: state is EditProfileLoading,
                        title: 'Save',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            BlocProvider.of<EditProfileCubit>(context)
                                .editProfile();
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        });
                  },
                )),
            const SizedBox(height: 26),
          ],
        ),
      ),
    );
  }
}
