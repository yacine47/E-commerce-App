import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_widget.dart';
import 'package:ecommerce_app/core/widgets/error_message_widget_auth.dart';
import 'package:ecommerce_app/core/widgets/go_back_button.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/cutom_text_field_signin.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/address_view_body.dart';
import 'package:ecommerce_app/features/seller_features/add/presentaion/view_models/add_coupon_cubit/add_coupon_cubit.dart';
import 'package:ecommerce_app/features/seller_features/add/presentaion/view_models/get_product_seller_cubit/get_product_seller_cubit.dart';
import 'package:ecommerce_app/features/seller_features/add/presentaion/views/widgets/custom_multi_select_diadlog_field_add_coupon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddCouponViewBody extends StatefulWidget {
  const AddCouponViewBody({super.key});

  @override
  State<AddCouponViewBody> createState() => _AddCouponViewBodyState();
}

class _AddCouponViewBodyState extends State<AddCouponViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCouponCubit, AddCouponState>(
      listener: (context, state) {
        if (state is AddCouponSuccess) {
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
                              'Add Coupon',
                              style: Styles.style24,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox()
                          ],
                        ),
                        const SizedBox(height: 25),
                        ErrMessageWidgetAuth(
                          isLoading: state is AddCouponFailure,
                          state: state,
                        ),
                        const SizedBox(height: 25),
                        CustomTextFieldSignIn(
                          hint: 'Copoun Code',
                          onSaved: (value) {
                            BlocProvider.of<AddCouponCubit>(context)
                                .couponCode = value!;
                          },
                        ),
                        const SpaceBetweenTextFieldAdress(),
                        CustomTextFieldSignIn(
                          hint: 'Discount Percentage',
                          onSaved: (value) {
                            BlocProvider.of<AddCouponCubit>(context)
                                .reductionPercentage = double.parse(value!);
                          },
                        ),
                        const SpaceBetweenTextFieldAdress(),
                        BlocBuilder<GetProductSellerCubit,
                            GetProductSellerState>(
                          builder: (context, state) {
                            if (state is GetProductSellerSuccess) {
                              return CustomMultiSelectDialogFieldAddCoupon(
                                multiSelectCategories: state.multiSelectProduct,
                              );
                            }
                            return const CustomLoadingWidget();
                          },
                        ),
                        const SpaceBetweenTextFieldAdress(),

                        // CustomDropDownAddCouponButton(
                        //   // valueRole: 'Day',
                        //   // onSaved: (value) => BlocProvider.of<RegisterCubit>(context)
                        //   //     .userModel
                        //   //     .role = value,
                        //   onSaved: (value) {},
                        //   onChanged: (value) {
                        //     // valueRole = value;
                        //     setState(() {});
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                CustomButtonSubmit(
                  isLoadingState: state is AddCouponLoading,
                  title: 'Submit',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      BlocProvider.of<AddCouponCubit>(context).addCoupon();
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
