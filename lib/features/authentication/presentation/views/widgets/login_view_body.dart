import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          GestureDetector(
              onTap: () => GoRouter.of(context).pop(),
              child: const Icon(IconlyLight.arrow_left, size: 28)),
          const SizedBox(height: 32),
          Text(
            'Sign in to your Account',
            style: Styles.style48.copyWith(fontSize: 44),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .14),
          const CustomTextField(
            hint: 'Email',
            prefixIcon: IconlyBold.message,
          ),
          const SizedBox(height: 22),
          const CustomTextField(
            hint: 'Password',
            prefixIcon: IconlyBold.lock,
            suffixIcon: IconlyBold.hide,
          ),
          const SizedBox(height: 22),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Forgot the password?',
              textAlign: TextAlign.center,
              style: Styles.style16.copyWith(
                color: MyColors.primaryColor2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 22),
          CustomButtonSubmit(
            title: 'Sign in',
            onPressed: () {},
          ),
          const SizedBox(height: 21),
          Align(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                  text: 'Don\'t have an account?  ',
                  style: Styles.style14,
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Sign up',
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


// Icon(
//             IconlyLight.search,
//             color: MyColors.hintColorTextField,
//             size: 20,
//           ),