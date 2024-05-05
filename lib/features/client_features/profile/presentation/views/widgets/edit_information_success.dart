import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/features/authentication/data/models/user_model.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/cutom_text_field_signin.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/view_models/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/views/widgets/edit_photo_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditInformationSuccess extends StatefulWidget {
  const EditInformationSuccess({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  State<EditInformationSuccess> createState() => _EditInformationSuccessState();
}

class _EditInformationSuccessState extends State<EditInformationSuccess> {
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  @override
  Widget build(BuildContext context) {
    firstNameController =
        TextEditingController(text: widget.userModel.firstName);
    lastNameController = TextEditingController(text: widget.userModel.lastName);
    BlocProvider.of<EditProfileCubit>(context).pathChar =
        widget.userModel.photoProfile!;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 23),
            const CustomAppBar(
              title: 'Edit Profile',
            ),
            // const SizedBox(height: 54),
            const SizedBox(height: 28),
            EditPhotoProfile(
              path: widget.userModel.photoProfile!,
            ),
            const SizedBox(height: 60),
            CustomTextFieldSignIn(
              controller: firstNameController,
              hint: 'First Name',
              onSaved: (value) {
                BlocProvider.of<EditProfileCubit>(context).firstName = value!;
              },
            ),
            const SizedBox(height: 24),
            CustomTextFieldSignIn(
              hint: 'Last Name',
              onSaved: (value) {
                BlocProvider.of<EditProfileCubit>(context).lastName = value!;
              },
              controller: lastNameController,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
