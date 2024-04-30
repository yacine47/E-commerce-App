import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/core/widgets/go_back_button.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/cutom_text_field_signin.dart';
import 'package:flutter/material.dart';

class AddressViewBody extends StatelessWidget {
  const AddressViewBody({super.key});

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
                  const SizedBox(height: 23),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const GoBackButton(),
                      Text(
                        'Shipping Address',
                        style: Styles.style24,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox()
                    ],
                  ),
                  const SizedBox(height: 50),
                  const CustomTextFieldSignIn(hint: 'Full Name'),
                  const SpaceBetweenTextFieldAdress(),
                  const CustomTextFieldSignIn(hint: 'Phone'),
                  const SpaceBetweenTextFieldAdress(),
                  const CustomTextFieldSignIn(hint: 'State'),
                  const SpaceBetweenTextFieldAdress(),
                  const CustomTextFieldSignIn(hint: 'City'),
                  const SpaceBetweenTextFieldAdress(),
                  const CustomTextFieldSignIn(hint: 'Adress 1'),
                  const SpaceBetweenTextFieldAdress(),
                  const CustomTextFieldSignIn(hint: 'Adress 2'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          CustomButtonSubmit(
            title: 'Add Address',
            onPressed: () {},
          ),
          const SizedBox(height: 27),
        ],
      ),
    );
  }
}

class SpaceBetweenTextFieldAdress extends StatelessWidget {
  const SpaceBetweenTextFieldAdress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 22);
  }
}
