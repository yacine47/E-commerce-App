import 'dart:io';

import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/widgets/custom_photo_profile.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/view_models/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';

class EditPhotoProfile extends StatefulWidget {
  const EditPhotoProfile({
    super.key,
    this.onTap,
    required this.path,
  });
  final String path;
  final VoidCallback? onTap;

  @override
  State<EditPhotoProfile> createState() => _EditPhotoProfileState();
}

class _EditPhotoProfileState extends State<EditPhotoProfile> {
  final ImagePicker imagePicker = ImagePicker();

  File? imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        imagePath == null
            ? CustomPhotoProfile(
                size: 64,
                photo: widget.path,
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(555),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 64,
                  child: Image.file(
                    imagePath!,
                    // alignment: const Alignment(0, .6),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
        GestureDetector(
          onTap: () async {
            final XFile? image =
                await imagePicker.pickImage(source: ImageSource.gallery);

            if (image?.path != null) {
              imagePath = File(image!.path);
              BlocProvider.of<EditProfileCubit>(context).imagePath = imagePath;
              setState(() {});
            }
          },
          child: CircleAvatar(
            backgroundColor: MyColors.hintColorTextField,
            radius: 18,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 17,
              child: Icon(
                IconlyLight.edit,
              ),
            ),
          ),
        )
      ],
    );
  }
}
