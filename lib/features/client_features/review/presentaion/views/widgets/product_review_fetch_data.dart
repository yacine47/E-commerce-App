import 'package:ecommerce_app/core/widgets/custom_failure_widget.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_widget.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/view_models/review_product_cubit/review_product_cubit.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/views/widgets/custom_review_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReviewFetchData extends StatelessWidget {
  const ProductReviewFetchData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewProductCubit, ReviewProductState>(
      builder: (context, state) {
        if (state is ReviewProductSuccess) {
          return CustomReviewItemListView(
            reviews: state.reviews,
          );
        } else if (state is ReviewProductFailure) {
          return CustomFailureWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
