import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/home/data/models/notification_model.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/add_review_cubit/add_review_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/all_order_item_delivred_cubit/all_order_item_delivred_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/add_review_product_item.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_rating_bar_picker.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_report_product_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddReviewViewBody extends StatefulWidget {
  const AddReviewViewBody({super.key, required this.notificationModel});

  final NotificationModel notificationModel;

  @override
  State<AddReviewViewBody> createState() => _AddReviewViewBodyState();
}

class _AddReviewViewBodyState extends State<AddReviewViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
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
                    const SizedBox(height: 26),
                    const CustomAppBar(
                      title: 'Add Review',
                    ),
                    // const SizedBox(height: 54),
                    const SizedBox(height: 30),
                    AddReviewProductItem(
                        product: widget.notificationModel.product!),
                    const SizedBox(height: 26),
                    Text('How is your order ?',
                        style: Styles.style24
                            .copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),

                    Text(
                      'please give your rating & also your review',
                      style: Styles.style16.copyWith(
                        color: MyColors.hintColorTextField,
                      ),
                    ),
                    const SizedBox(height: 29),
                    const CustomRatingBarPicker(),
                    SizedBox(height: MediaQuery.of(context).size.height * .05),
                    CustomReportProductTextFromField(
                      hint: 'Add a Comment',
                      maxLines: 8,
                      onSaved: (value) {
                        BlocProvider.of<AddReviewCubit>(context).comment =
                            value!;
                      },
                    )
                  ],
                ),
              ),
            ),
            ItemHasPadding(
              horPadding: 0,
              verPadding: 20,
              child: BlocConsumer<AddReviewCubit, AddReviewState>(
                listener: (context, state) {
                  if (state is AddReviewSuccess) {
                    BlocProvider.of<AllOrderItemDelivredCubit>(context)
                        .getAllOrderItemDelivred();
                    GoRouter.of(context).pop();
                  }
                },
                builder: (context, state) {
                  return CustomButtonSubmit(
                    title: 'Submit',
                    isLoadingState: state is AddReviewLoading,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        BlocProvider.of<AddReviewCubit>(context).productId =
                            widget.notificationModel.product!.id!;

                        BlocProvider.of<AddReviewCubit>(context)
                            .notificationId = widget.notificationModel.id!;

                        BlocProvider.of<AddReviewCubit>(context)
                            .createReviewProduct();
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
