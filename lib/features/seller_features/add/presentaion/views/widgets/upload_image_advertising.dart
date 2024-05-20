import 'dart:io';

import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/seller_features/add/presentaion/view_models/add_advertising_cubit/add_advertising_cubit.dart';
import 'package:ecommerce_app/features/seller_features/add/presentaion/views/widgets/custom_upload_image_advertising_selected.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageAdvertising extends StatefulWidget {
  const UploadImageAdvertising({super.key});

  @override
  State<UploadImageAdvertising> createState() => _UploadImageAdvertisingState();
}

class _UploadImageAdvertisingState extends State<UploadImageAdvertising> {
  final ImagePicker imagePicker = ImagePicker();
  List<File> listImagePick = [];

  void selectImages(context) async {
    // List<File> listImagePick = BlocProvider.of<AddProductCubit>(context).images;
    List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty &&
        listImagePick.length + selectedImages.length <= 8) {
      for (var element in selectedImages) {
        listImagePick.add(File(element.path));
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    //
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHorPadding, vertical: kHorPadding - 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // const SizedBox(height: 1),

          GestureDetector(
            onTap: () async {
              final XFile? image =
                  await imagePicker.pickImage(source: ImageSource.gallery);

              if (image?.path != null) {
                BlocProvider.of<AddAdvertisingCubit>(context).image =
                    File(image!.path);
                setState(() {});
              }
            },
            child: const Iconify(
              addImageIcon,
              size: 42,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),

          // BlocBuilder<AddProductCubit, AddProductState>(
          //   builder: (context, state) {
          //     if (state is AddProductImagesEmpty) {
          //       return CustomFailureWidget(errMessage: state.errMessage);
          //     }
          //     return const CustomFailureWidget(errMessage: '');
          //   },
          // ),
          const SizedBox(height: 16),

          // ),
          BlocProvider.of<AddAdvertisingCubit>(context).image != null
              ? CustomUploadImageAdvertisingSelected(
                  image: BlocProvider.of<AddAdvertisingCubit>(context).image!,
                  onTap: () {
                    BlocProvider.of<AddAdvertisingCubit>(context).image = null;
                    setState(() {});
                  },
                )
              : const SizedBox(),
          const SizedBox(height: 16),
          Text(
            BlocProvider.of<AddAdvertisingCubit>(context).image== null ? '0/1':'1/1',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
