import 'package:ecommerce_app/core/widgets/error_message_widget.dart';
import 'package:ecommerce_app/features/authentication/presentation/view_models/register_cubit/register_cubit.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/login_view.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/auther_option.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/go_back_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/custom_drop_down_button.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/cutom_text_field_signin.dart';
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
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          GoRouter.of(context).push(LoginView.path);
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
                  'Create your Account',
                  style: Styles.style40,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                ErrMessageWidget(
                  isLoading: state is RegisterFailure,
                  state: state,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .02),
                Row(
                  children: [
                    Flexible(
                      child: CustomTextFieldSignIn(
                        onSaved: (value) =>
                            BlocProvider.of<RegisterCubit>(context)
                                .userModel
                                .firstName = value,
                        hint: 'First Name',
                        suffixIcon: IconlyLight.profile,
                      ),
                    ),
                    const SizedBox(width: 18),
                    Flexible(
                      child: CustomTextFieldSignIn(
                        onSaved: (value) =>
                            BlocProvider.of<RegisterCubit>(context)
                                .userModel
                                .lastName = value,
                        hint: 'Last Name',
                        suffixIcon: IconlyLight.profile,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: kSpaceBetweenTextField),
                CustomTextFieldSignIn(
                  onSaved: (value) => BlocProvider.of<RegisterCubit>(context)
                      .userModel
                      .email = value,
                  hint: 'Email',
                  suffixIcon: IconlyLight.message,
                ),
                const SizedBox(height: kSpaceBetweenTextField),
                CustomTextFieldSignIn(
                  onSaved: (value) => BlocProvider.of<RegisterCubit>(context)
                      .userModel
                      .password = value,
                  hint: 'Password',
                  suffixIcon: IconlyLight.lock,
                ),
                const SizedBox(height: kSpaceBetweenTextField),
                CustomTextFieldSignIn(
                  onSaved: (value) => BlocProvider.of<RegisterCubit>(context)
                      .userModel
                      .passwordConfirmation = value,
                  hint: 'Confirm Password',
                  suffixIcon: IconlyLight.lock,
                ),
                const SizedBox(height: kSpaceBetweenTextField),
                CustomDropDownButton(
                  valueRole: valueRole,
                  onSaved: (value) => BlocProvider.of<RegisterCubit>(context)
                      .userModel
                      .role = value,
                  onChanged: (value) {
                    valueRole = value;
                    setState(() {});
                  },
                ),
                const SizedBox(height: 34),
                CustomButtonSubmit(
                  title: 'Sign up',
                  isLoadingState: state is RegisterLoading,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      await BlocProvider.of<RegisterCubit>(context).register();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                    }
                  },
                ),
                const SizedBox(height: 21),
                AutherOption(
                  text: 'Already have an account?',
                  buttonText: 'Sign in',
                  onTap: () => GoRouter.of(context).pop(),
                )
              ],
            ),
          )),
        );
      },
    );
  }
}
