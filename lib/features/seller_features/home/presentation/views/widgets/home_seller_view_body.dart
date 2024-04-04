import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeSellerViewBody extends StatefulWidget {
  const HomeSellerViewBody({super.key});

  @override
  State<HomeSellerViewBody> createState() => _HomeSellerViewBodyState();
}

class _HomeSellerViewBodyState extends State<HomeSellerViewBody> {
  final ImagePicker imagePicker = ImagePicker();

  File? imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
          child: GestureDetector(
            onTap: () async {
              final XFile? image =
                  await imagePicker.pickImage(source: ImageSource.gallery);

              if (image?.path != null) {
                imagePath = File(image!.path);
                setState(() {});
              }
            },
            child: Text(
              'Pick Image',
              style: Styles.style35,
            ),
          ),
        ),
        imagePath == null ? const SizedBox() : Image.file(imagePath!),
        ElevatedButton(
          onPressed: () async {
            if (imagePath?.path != null) {
              FormData formData = FormData.fromMap({
                "image": await MultipartFile.fromFile(imagePath!.path,
                    filename: imagePath!.path.split('/').last),
              });
              try {
                var respose = await ApiService(Dio()).post(
                  'store',
                  formData,
                );

                print(respose);
              } on Exception catch (e) {
                // TODO
              }
            }
          },
          child: const Text('Upload'),
        ),
      ],
    );
  }
}
