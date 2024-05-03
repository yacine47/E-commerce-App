import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/core/widgets/error_message_widget_auth.dart';
import 'package:ecommerce_app/core/widgets/go_back_button.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/cutom_text_field_signin.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/create_address_cubit/create_address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddressViewBody extends StatefulWidget {
  const AddressViewBody({super.key, this.onCreateAddress});

  final VoidCallback? onCreateAddress;

  @override
  State<AddressViewBody> createState() => _AddressViewBodyState();
}

class _AddressViewBodyState extends State<AddressViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateAddressCubit, CreateAddressState>(
      listener: (context, state) {
        if (state is CreateAddressSuccess) {
          // MyObjects.addressModel = state.address;
          GoRouter.of(context).pop();
          
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: ItemHasPadding(
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
                        const SizedBox(height: 25),
                        ErrMessageWidgetAuth(
                          isLoading: state is CreateAddressFailure,
                          state: state,
                        ),
                        const SizedBox(height: 25),
                        CustomTextFieldSignIn(
                          hint: 'Full Name',
                          onSaved: (value) {
                            BlocProvider.of<CreateAddressCubit>(context)
                                .fullName = value!;
                          },
                        ),
                        const SpaceBetweenTextFieldAdress(),
                        CustomTextFieldSignIn(
                          hint: 'Phone',
                          onSaved: (value) {
                            BlocProvider.of<CreateAddressCubit>(context)
                                .phoneNumber = value!;
                          },
                        ),
                        const SpaceBetweenTextFieldAdress(),
                        CustomTextFieldSignIn(
                          hint: 'State',
                          onSaved: (value) {
                            BlocProvider.of<CreateAddressCubit>(context)
                                .stateAddress = value!;
                          },
                        ),
                        const SpaceBetweenTextFieldAdress(),
                        CustomTextFieldSignIn(
                          hint: 'City',
                          onSaved: (value) {
                            BlocProvider.of<CreateAddressCubit>(context).city =
                                value!;
                          },
                        ),
                        const SpaceBetweenTextFieldAdress(),
                        CustomTextFieldSignIn(
                          hint: 'Adress',
                          onSaved: (value) {
                            BlocProvider.of<CreateAddressCubit>(context)
                                .addressLine = value!;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                CustomButtonSubmit(
                  isLoadingState: state is CreateAddressLoading,
                  title: 'Add Address',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      BlocProvider.of<CreateAddressCubit>(context)
                          .createNewAddress();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
                const SizedBox(height: 27),
              ],
            ),
          ),
        );
      },
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
