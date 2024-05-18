import 'dart:io';

import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/custom_failure_widget.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/view_models/add_product_cubit/add_product_cubit.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/widgets/custom_upload_image_selected.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:image_picker/image_picker.dart';

class UploadMultipleImage extends StatefulWidget {
  const UploadMultipleImage({super.key});

  @override
  State<UploadMultipleImage> createState() => _UploadMultipleImageState();
}

class _UploadMultipleImageState extends State<UploadMultipleImage> {
  final ImagePicker imagePicker = ImagePicker();
  // List<File> listImagePick = [];

  void selectImages(context) async {
    List<File> listImagePick = BlocProvider.of<AddProductCubit>(context).images;
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
            onTap: () {
              selectImages(context);
            },
            child: const Iconify(
              addImageIcon,
              size: 42,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),

          BlocBuilder<AddProductCubit, AddProductState>(
            builder: (context, state) {
              if (state is AddProductImagesEmpty) {
                return CustomFailureWidget(errMessage: state.errMessage);
              }
              return const CustomFailureWidget(errMessage: '');
            },
          ),
          const SizedBox(height: 16),
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              // childAspectRatio: 0.8,
            ),
            itemCount: BlocProvider.of<AddProductCubit>(context).images.length,
            itemBuilder: (context, index) => CustomUploadImageSelected(
              image: BlocProvider.of<AddProductCubit>(context).images[index],
              onTap: () {
                BlocProvider.of<AddProductCubit>(context)
                    .images
                    .removeAt(index);
                setState(() {});
              },
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '${BlocProvider.of<AddProductCubit>(context).images.length}/8',
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
