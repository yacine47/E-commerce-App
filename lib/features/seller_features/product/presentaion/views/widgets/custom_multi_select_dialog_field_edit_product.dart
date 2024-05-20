

import 'package:ecommerce_app/core/functions/validator_function.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/view_models/edit_product_cubit/edit_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class CustomMultiSelectDialogFieldEditProduct extends StatelessWidget {
  const CustomMultiSelectDialogFieldEditProduct({
    super.key,
    required this.multiSelectCategories,
    required this.initValues,
  });

  final List<MultiSelectItem<int>> multiSelectCategories;
  final List<int> initValues;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: MyColors.textFieldColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: MultiSelectDialogField(
        checkColor: Colors.white,
        dialogWidth: MediaQuery.of(context).size.height,
        isDismissible: true,
        items: multiSelectCategories,
        title: const Text("Categories"),
        selectedColor: MyColors.primaryColor2,
        initialValue: initValues ,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: MyColors.textFieldColor,
        ),
        buttonIcon: const Icon(
          Icons.category,
          color: MyColors.textFieldColor,
        ),
        buttonText: Text(
          "Chose Category",
          style: Styles.style14,
        ),
        onConfirm: (results) {
          // BlocProvider.of<AddProductCubit>(context).categoriesProduct = results;
        },
        onSaved: (newValue) {
          BlocProvider.of<EditProductCubit>(context).categoriesProduct =
              newValue!;
        },
        validator: validatorMultiSelect,
      ),
    );
  }
}
