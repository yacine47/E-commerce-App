import 'dart:io';

import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/widgets/custom_failure_widget.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/view_models/edit_product_cubit/edit_product_cubit.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/widgets/custom_upload_image_selected_edit_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:image_picker/image_picker.dart';

class UploadMultipleImageEditProduct extends StatefulWidget {
  const UploadMultipleImageEditProduct({super.key, required this.product});
  final ProductModel product;

  @override
  State<UploadMultipleImageEditProduct> createState() =>
      _UploadMultipleImageEditProductState();
}

class _UploadMultipleImageEditProductState
    extends State<UploadMultipleImageEditProduct> {
  @override
  void initState() {
    for (int i = 0; i < widget.product.images!.length; i++) {
      BlocProvider.of<EditProductCubit>(context)
          .images
          .add(widget.product.images![i]);
    }
    super.initState();
  }

  final ImagePicker imagePicker = ImagePicker();
  // List<File> listImagePick = [];

  void selectImages(context) async {
    List<dynamic> listImagePick =
        BlocProvider.of<EditProductCubit>(context).images;
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

          BlocBuilder<EditProductCubit, EditProductState>(
            builder: (context, state) {
              if (state is EditProductImagesEmpty) {
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
            itemCount: BlocProvider.of<EditProductCubit>(context).images.length,
            itemBuilder: (context, index) =>
                CustomUploadImageSelectedEditProduct(
              image: BlocProvider.of<EditProductCubit>(context).images[index],
              onTap: () {
                BlocProvider.of<EditProductCubit>(context)
                    .images
                    .removeAt(index);
                setState(() {});
              },
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '${BlocProvider.of<EditProductCubit>(context).images.length}/8',
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
