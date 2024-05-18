import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/core/widgets/custom_card_item_height.dart';
import 'package:ecommerce_app/core/widgets/error_message_widget_auth.dart';
import 'package:ecommerce_app/core/widgets/go_back_button.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/cutom_text_field_signin.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/address_view_body.dart';
import 'package:ecommerce_app/features/seller_features/home/presentation/view_models/product_seller_cubit/product_seller_cubit.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/view_models/add_product_cubit/add_product_cubit.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/widgets/upload_multiple_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          GoRouter.of(context).pop();
        }
      },
      builder: (context, state) {
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
                              'Add Product',
                              style: Styles.style24,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox()
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      ErrMessageWidgetAuth(
                        isLoading: state is AddProductFailure,
                        state: state,
                      ),
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
                                BlocProvider.of<AddProductCubit>(context)
                                    .price = int.parse(value!);
                              },
                            ),
                            const SpaceBetweenTextFieldAdress(),
                            CustomTextFieldSignIn(
                              hint: 'Quantity',
                              onSaved: (value) {
                                BlocProvider.of<AddProductCubit>(context)
                                    .quantity = int.parse(value!);
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
                  isLoadingState: state is AddProductLoading,
                  title: 'Add Product',
                  onPressed: () {
                    if (formKey.currentState!.validate() &&
                        BlocProvider.of<AddProductCubit>(context)
                                .images
                                .length >
                            2) {
                      BlocProvider.of<AddProductCubit>(context)
                          .listImagesEmpty('');
                      formKey.currentState!.save();
                      BlocProvider.of<AddProductCubit>(context).addNewProduct();
                      BlocProvider.of<ProductSellerCubit>(context)
                          .getProductOfSeller();
                    } else {
                      autovalidateMode = AutovalidateMode.always;

                      BlocProvider.of<AddProductCubit>(context).listImagesEmpty(
                          'The Number required of images is 3 min');
                      setState(() {});
                    }
                  },
                ),
              ),
              const SizedBox(height: 27),
            ],
          ),
        );
      },
    );
  }
}
