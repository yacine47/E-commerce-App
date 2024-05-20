import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:flutter/material.dart';

class SellerOrderDetailsViewBody extends StatefulWidget {
  const SellerOrderDetailsViewBody({super.key});

  @override
  State<SellerOrderDetailsViewBody> createState() =>
      _SellerOrderDetailsViewBodyState();
}

class _SellerOrderDetailsViewBodyState
    extends State<SellerOrderDetailsViewBody> {
  List<StepperData> stepperData = [
    StepperData(
      title: StepperText("USA"),
      subtitle: StepperText("Hello"),
    ),
    StepperData(
      title: StepperText("Canada"),
      subtitle: StepperText("Hey"),
    ),
    StepperData(
      title: StepperText("Turkey"),
      subtitle: StepperText("Hi"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ItemHasPadding(
      horPadding: kHorPadding,
      child: Column(
        children: [
          const SizedBox(height: 23),
          const CustomAppBar(
            title: 'Order Details',
          ),
          const SizedBox(height: 26),
          Material(
            color: MyColors.primaryColor,
            child: AnotherStepper(
              stepperList: stepperData,
              stepperDirection: Axis.vertical,
              // inverted: ,

              iconWidth: 46,
              iconHeight: 46,
              activeBarColor: MyColors.primaryColor,
              inActiveBarColor: Colors.grey,
              activeIndex: 1,
            ),
          )
        ],
      ),
    );
  }
}
