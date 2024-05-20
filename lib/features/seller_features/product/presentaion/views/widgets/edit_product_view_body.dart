import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/core/widgets/custom_card_item_height.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_widget.dart';
import 'package:ecommerce_app/core/widgets/error_message_widget_auth.dart';
import 'package:ecommerce_app/core/widgets/go_back_button.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/cutom_text_field_signin.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/address_view_body.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/view_models/all_category_cubit/all_categories_cubit.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/view_models/category_product_cubit/category_product_cubit.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/view_models/edit_product_cubit/edit_product_cubit.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/widgets/custom_multi_select_dialog_field_edit_product.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/widgets/upload_multiple_image_edit_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../home/presentation/view_models/product_seller_cubit/product_seller_cubit.dart';

class EditProductViewBody extends StatefulWidget {
  const EditProductViewBody({super.key, required this.product});
  final ProductModel product;

  @override
  State<EditProductViewBody> createState() => _EditProductViewBodyState();
}

class _EditProductViewBodyState extends State<EditProductViewBody> {
  @override
  void initState() {
    BlocProvider.of<CategoryProductCubit>(context)
        .getCategoryProduct(widget.product.id!);
    super.initState();
  }

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProductCubit, EditProductState>(
      listener: (context, state) {
        if (state is EditProductSuccess) {
          BlocProvider.of<ProductSellerCubit>(context).getProductOfSeller();
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
                              'Edit Product',
                              style: Styles.style24,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox()
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      ErrMessageWidgetAuth(
                        isLoading: state is EditProductFailure,
                        state: state,
                      ),
                      const SizedBox(height: 16),
                      ItemHasPadding(
                        horPadding: kHorPadding,
                        child: CustomCardItem(
                          child: UploadMultipleImageEditProduct(
                            product: widget.product,
                          ),
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
                              controller: TextEditingController(
                                  text: widget.product.name),
                              onSaved: (value) {
                                BlocProvider.of<EditProductCubit>(context).name =
                                    value!;
                              },
                            ),
                            const SpaceBetweenTextFieldAdress(),
                            CustomTextFieldSignIn(
                              hint: 'Price',
                              controller: TextEditingController(
                                  text: widget.product.price.toString()),
                              onSaved: (value) {
                                BlocProvider.of<EditProductCubit>(context)
                                    .price = int.parse(value!);
                              },
                            ),
                            const SpaceBetweenTextFieldAdress(),
                            CustomTextFieldSignIn(
                              hint: 'Quantity',
                              controller: TextEditingController(
                                  text: widget.product.quantity.toString()),
                              onSaved: (value) {
                                BlocProvider.of<EditProductCubit>(context)
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
                            BlocBuilder<AllCategoriesCubit, AllCategoriesState>(
                              builder: (context, stateAllCategories) {
                                if (stateAllCategories
                                    is AllCategoriesSuccess) {
                                  return BlocBuilder<CategoryProductCubit,
                                      CategoryProductState>(
                                    builder: (context, stateCategoryProduct) {
                                      if (stateCategoryProduct
                                          is CategoryProductSuccess) {
                                        return CustomMultiSelectDialogFieldEditProduct(
                                          multiSelectCategories:
                                              stateAllCategories.categories,
                                          initValues:
                                              stateCategoryProduct.initValues,
                                        );
                                      }
                                      return const CustomLoadingWidget();
                                    },
                                  );
                                }
                                return const CustomLoadingWidget();
                              },
                            ),
                            const SpaceBetweenTextFieldAdress(),
                            CustomTextFieldSignIn(
                              hint: 'Description',
                              controller: TextEditingController(
                                  text: widget.product.description.toString()),
                              // minLines: 1,
                              maxLines: 8,
                              onSaved: (value) {
                                BlocProvider.of<EditProductCubit>(context)
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
                  isLoadingState: state is EditProductLoading,
                  title: 'Edit Product',
                  onPressed: () {
                    if (formKey.currentState!.validate() &&
                        BlocProvider.of<EditProductCubit>(context)
                                .images
                                .length >
                            2) {
                      BlocProvider.of<EditProductCubit>(context)
                          .listImagesEmpty('');
                      formKey.currentState!.save();
                      BlocProvider.of<EditProductCubit>(context).editProduct(
                        widget.product.id!,
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      BlocProvider.of<EditProductCubit>(context)
                          .listImagesEmpty(
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
