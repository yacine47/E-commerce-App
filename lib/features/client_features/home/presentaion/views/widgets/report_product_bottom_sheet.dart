import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/core/widgets/error_message_widget_auth.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/report_product_cubit/report_product_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_report_product_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ReportProductBottomSheet extends StatefulWidget {
  const ReportProductBottomSheet({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  State<ReportProductBottomSheet> createState() =>
      _ReportProductBottomSheetState();
}

class _ReportProductBottomSheetState extends State<ReportProductBottomSheet> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReportProductCubit, ReportProductState>(
      listener: (context, state) {
        if (state is ReportProductSuccess) {
          GoRouter.of(context).pop();
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is ReportProductLoading,
          child: Form(
            key: formKey,
            child: ModalProgressHUD(
              inAsyncCall: state is ReportProductLoading,
              color: MyColors.primaryColor,
              blur: 1,
              // dismissible: true,
              opacity: .15,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .6,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      Container(
                        height: 4,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Reprot',
                        style: Styles.style18,
                      ),
                      const SizedBox(height: 8),
                      Divider(
                        color: MyColors.hintColorTextField,
                        thickness: 0,
                      ),
                      const SizedBox(height: 12),
                      ErrMessageWidgetAuth(
                        isLoading: state is ReportProductFailure,
                        state: state,
                      ),
                      const SizedBox(height: 18),
                      ItemHasPadding(
                        horPadding: kHorPadding,
                        child: Column(
                          children: [
                            CustomReportProductTextFromField(
                              hint: 'Report Title',
                              onSaved: (value) {
                                BlocProvider.of<ReportProductCubit>(context)
                                    .title = value!;
                              },
                            ),
                            const SizedBox(height: 16),
                            CustomReportProductTextFromField(
                              onSaved: (value) {
                                BlocProvider.of<ReportProductCubit>(context)
                                    .content = value!;
                              },
                              hint: 'Addition Content',
                              maxLines: 5,
                            ),
                            const SizedBox(height: 48),
                            CustomButtonSubmit(
                              title: 'Add Report',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  BlocProvider.of<ReportProductCubit>(context)
                                      .createReportProduct(
                                          widget.productModel.id!);
                                } else {
                                  autovalidateMode = AutovalidateMode.always;
                                  setState(() {});
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
