import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  final int currectSetup;

  const CustomStepper(
      {super.key, required this.currectSetup}); // Example current setup value

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStep(context, 'Pending', 0),
        _buildStep(context, 'Accepted', 1),
        _buildStep(context, 'Shipped', 2),
        _buildStep(context, 'Delivered', 3),
      ],
    );
  }

  Widget _buildStep(context, String title, int stepIndex) {
    bool isActive = currectSetup >= stepIndex;
    bool isCompleted = currectSetup > stepIndex;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildStepIcon(isActive, isActive),
            if (stepIndex != 3)
              _buildStepConnector(context, isActive, isCompleted),
          ],
        ),
        ItemHasPadding(
          horPadding: kHorPadding,
          verPadding: 6,
          child: Text(
            title,
            style: Styles.style20.copyWith(color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildStepIcon(bool isActive, bool isCompleted) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? MyColors.primaryColor : MyColors.hintColorTextField,
        borderRadius: BorderRadius.circular(555),
        border: Border.all(
          color: isCompleted
              ? MyColors.primaryColorWithOpacity
              : MyColors.lighBackgroundColor,
          width: 4,
        ),
      ),
      child: const SizedBox(width: 20, height: 20),
    );
  }

  Widget _buildStepConnector(context, bool isActive, bool isCompleted) {
    return Container(
      height: MediaQuery.of(context).size.height * .1,
      width: 1.5,
      color: isCompleted
          ? MyColors.primaryColor.withOpacity(0.5)
          : MyColors.hintColorTextField,
      margin: const EdgeInsets.symmetric(vertical: 1),
    );
  }
}
