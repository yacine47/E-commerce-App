import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/custom_supplement_text_field.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_rating_bar_picker.dart';
import 'package:flutter/material.dart';

class AddReviewViewBody extends StatelessWidget {
  const AddReviewViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemHasPadding(
      horPadding: kHorPadding,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 26),
                  const CustomAppBar(
                    title: 'Add Review',
                  ),
                  // const SizedBox(height: 54),
                  const SizedBox(height: 36),
                  Text('How is your order ?',
                      style:
                          Styles.style24.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),

                  Text(
                    'please give your rating & also your review',
                    style: Styles.style16.copyWith(
                      color: MyColors.hintColorTextField,
                    ),
                  ),
                  const SizedBox(height: 29),
                  const CustomRatingBarPicker(),
                  const SizedBox(height: 59),
                  const CustomSupplementTextField(
                    hint: 'Add a Comment',
                    maxLines: 8,
                  )
                ],
              ),
            ),
          ),
          ItemHasPadding(
            horPadding: 0,
            verPadding: 20,
            child: CustomButtonSubmit(
              title: 'Submit',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
