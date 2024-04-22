import 'package:ecommerce_app/core/widgets/custom_failure_widget.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_category_item_list_view.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/category_cubit/category_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/category_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryItemsFetchData extends StatelessWidget {
  const CategoryItemsFetchData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategorySuccess) {
          return CategoryItemListView(
            categories: state.categories,
          );
        } else if (state is CategoryFailure) {
          return CustomFailureWidget(
            errMessage: state.errMessage,
          );
        }
        return const CustomLoadingCategoryItemListView();
      },
    );
  }
}
