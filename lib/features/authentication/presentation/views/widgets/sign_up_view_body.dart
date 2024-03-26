import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/custom_drop_down_button.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/cutom_text_field_signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  String? valueRole;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 28),
          GestureDetector(
              onTap: () => GoRouter.of(context).pop(),
              child: const Icon(IconlyLight.arrow_left, size: 28)),
          const SizedBox(height: 24),
          Text(
            'Create your Account',
            style: Styles.style40,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .04),
          const Row(
            children: [
              Flexible(
                child: CustomTextFieldSignIn(
                  hint: 'First Name',
                  suffixIcon: IconlyLight.profile,
                ),
              ),
              SizedBox(width: 18),
              Flexible(
                child: CustomTextFieldSignIn(
                  hint: 'Last Name',
                  suffixIcon: IconlyLight.profile,
                ),
              ),
            ],
          ),
          const SizedBox(height: spaceBetweenTextField),
          const CustomTextFieldSignIn(
            hint: 'Email',
            suffixIcon: IconlyLight.message,
          ),
          const SizedBox(height: spaceBetweenTextField),
          const CustomTextFieldSignIn(
            hint: 'Password',
            suffixIcon: IconlyLight.lock,
          ),
          const SizedBox(height: spaceBetweenTextField),
          const CustomTextFieldSignIn(
            hint: 'Password',
            suffixIcon: IconlyLight.lock,
          ),
          const SizedBox(height: spaceBetweenTextField),
          CustomDropDownButton(
            valueRole: valueRole,
            onChanged: (value) {
              valueRole = value;
              setState(() {});
            },
          ),
          const SizedBox(height: 34),
          CustomButtonSubmit(
            title: 'Sign up',
            onPressed: () {},
          ),
          const SizedBox(height: 21),
          Align(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                  text: 'Already have an account?  ',
                  style: Styles.style14,
                  children: [
                    TextSpan(
                      text: ' Sign in',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => GoRouter.of(context).pop(),
                      style: Styles.style14.copyWith(
                        color: MyColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    ));
  }
}
