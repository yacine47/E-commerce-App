import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/core/widgets/custom_card_item_height.dart';
import 'package:ecommerce_app/core/widgets/go_back_button.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/cutom_text_field_signin.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/address_view_body.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/view_models/add_product_cubit/add_product_cubit.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/widgets/upload_multiple_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProductViewBody extends StatefulWidget {
  const EditProductViewBody({super.key});

  @override
  State<EditProductViewBody> createState() => _EditProductViewBodyState();
}

class _EditProductViewBodyState extends State<EditProductViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 23),
                  ItemHasPadding(
                    horPadding: kHorPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const GoBackButton(),
                        Text(
                          'Edit Product',
                          style: Styles.style24,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox()
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  // ErrMessageWidgetAuth(
                  //   isLoading: state is CreateAddressFailure,
                  //   state: state,
                  // ),
                  const SizedBox(height: 16),
                  const ItemHasPadding(
                    horPadding: kHorPadding,
                    child: CustomCardItem(
                      child: UploadMultipleImage(),
                    ),
                  ),

                  const SpaceBetweenTextFieldAdress(),
                  const SpaceBetweenTextFieldAdress(),
                  ItemHasPadding(
                    horPadding: kHorPadding,
                    child: Column(
                      children: [
                        CustomTextFieldSignIn(
                          hint: 'Product Name',
                          onSaved: (value) {
                            BlocProvider.of<AddProductCubit>(context).name =
                                value!;
                          },
                        ),
                        const SpaceBetweenTextFieldAdress(),
                        CustomTextFieldSignIn(
                          hint: 'Price',
                          onSaved: (value) {
                            BlocProvider.of<AddProductCubit>(context).price =
                                int.parse(value!);
                          },
                        ),
                        const SpaceBetweenTextFieldAdress(),
                        CustomTextFieldSignIn(
                          hint: 'Quantity',
                          onSaved: (value) {
                            BlocProvider.of<AddProductCubit>(context).quantity =
                                int.parse(value!);
                          },
                        ),
                        // const SpaceBetweenTextFieldAdress(),
                        // CustomTextFieldSignIn(
                        //   hint: 'Category',
                        //   onSaved: (value) {
                        //     // BlocProvider.of<CreateAddressCubit>(context).city =
                        //     // value!;
                        //   },
                        // ),
                        const SpaceBetweenTextFieldAdress(),
                        CustomTextFieldSignIn(
                          hint: 'Description',
                          // minLines: 1,
                          maxLines: 8,
                          onSaved: (value) {
                            BlocProvider.of<AddProductCubit>(context)
                                .description = value!;
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          ItemHasPadding(
            horPadding: kHorPadding,
            child: CustomButtonSubmit(
              // isLoadingState: state is CreateAddressLoading,
              title: 'Edit Product',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  BlocProvider.of<AddProductCubit>(context).addNewProduct();
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ),
          const SizedBox(height: 27),
        ],
      ),
    );
  }
}
