import 'package:ecommerce_app/core/functions/validator_function.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomDropDownAddCouponButton extends StatelessWidget {
  const CustomDropDownAddCouponButton(
      {super.key, this.onChanged, this.onSaved});
  final void Function(String?)? onChanged;
  final Function(String?)? onSaved;
  // final String? valueRole;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: MyColors.textFieldColor,
          borderRadius: BorderRadius.circular(12)),
      child: DropdownButtonFormField<String>(
        iconEnabledColor: MyColors.textFieldColor,
        items: const [
          DropdownMenuItem(
            value: 'Day',
            child: Text('Day'),
          ),
          DropdownMenuItem(
            value: 'Week',
            child: Text('Week'),
          ),
        ],
        isExpanded: true,
        padding: const EdgeInsets.symmetric(vertical: 6),
        dropdownColor: MyColors.textFieldColor,
        hint: Text(
          'Enter Expired Date Coupon',
          style: Styles.style14,
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(left: 16, right: 14),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(12))),
        ),
        enableFeedback: true,
        borderRadius: BorderRadius.circular(12),
        // value: valueRole,
        onChanged: onChanged,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
