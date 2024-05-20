import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/core/widgets/custom_card_item_height.dart';
import 'package:ecommerce_app/core/widgets/error_message_widget_auth.dart';
import 'package:ecommerce_app/core/widgets/go_back_button.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/seller_features/add/presentaion/view_models/add_advertising_cubit/add_advertising_cubit.dart';
import 'package:ecommerce_app/features/seller_features/add/presentaion/views/widgets/upload_image_advertising.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddAdvertisingViewBody extends StatefulWidget {
  const AddAdvertisingViewBody({super.key});

  @override
  State<AddAdvertisingViewBody> createState() => _AddAdvertisingViewBodyState();
}

class _AddAdvertisingViewBodyState extends State<AddAdvertisingViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddAdvertisingCubit, AddAdvertisingState>(
      listener: (context, state) {
        if (state is AddAdvertisingSuccess) {
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
                              'Add Advertising',
                              style: Styles.style24,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox()
                            // addFeaturesRepo
                          ],
                        ),
                        const SizedBox(height: 25),
                        ErrMessageWidgetAuth(
                          isLoading: state is AddAdvertisingFailure,
                          state: state,
                        ),
                        const SizedBox(height: 25),
                        const CustomCardItem(
                          child: UploadImageAdvertising(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                CustomButtonSubmit(
                  isLoadingState: state is AddAdvertisingLoading,
                  title: 'Submit',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      BlocProvider.of<AddAdvertisingCubit>(context)
                          .addAdvertising();
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
