import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/core/widgets/error_message_widget.dart';
import 'package:ecommerce_app/features/authentication/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/sign_up_view.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/auther_option.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/core/widgets/go_back_button.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/home_client_view.dart';
import 'package:ecommerce_app/features/seller_features/home/presentation/views/home_seller_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          navigateToHomeView(state, context);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 28),
                const GoBackButton(),
                const SizedBox(height: 24),
                Text(
                  'Sign in to your Account',
                  style: Styles.style40,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .07),
                ErrMessageWidget(
                  isLoading: state is LoginFailure,
                  state: state,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .07),
                CustomTextFromField(
                  hint: 'Email',
                  prefixIcon: IconlyBold.message,
                  onSaved: (value) => BlocProvider.of<LoginCubit>(context)
                      .userModel
                      .email = value,
                ),
                const SizedBox(height: 22),
                CustomTextFromField(
                  hint: 'Password',
                  prefixIcon: IconlyBold.lock,
                  suffixIcon: IconlyBold.hide,
                  onSaved: (value) => BlocProvider.of<LoginCubit>(context)
                      .userModel
                      .password = value,
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
                  isLoadingState: state is LoginLoading,
                  title: 'Sign in',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      BlocProvider.of<LoginCubit>(context).login();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
                const SizedBox(height: 21),
                AutherOption(
                  text: 'Don\'t have an account?',
                  buttonText: 'Sign up',
                  onTap: () => GoRouter.of(context).push(SignUpView.path),
                )
              ],
            ),
          )),
        );
      },
    );
  }

  void navigateToHomeView(LoginSuccess state, BuildContext context) {
    if (state.userModel.role == 'client') {
      GoRouter.of(context).pushReplacement(HomeClientView.path);
    } else if (state.userModel.role == 'seller') {
      GoRouter.of(context).pushReplacement(HomeSellerView.path);
    }
  }
}
