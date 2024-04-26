import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/client_features/search/data/models/result_model.dart';
import 'package:ecommerce_app/features/client_features/search/presentaion/views/widgets/product_items_result_fetch_data.dart';
import 'package:ecommerce_app/features/client_features/search/presentaion/views/widgets/result_product_app_bar.dart';
import 'package:flutter/material.dart';

class ResultProductViewBody extends StatelessWidget {
  const ResultProductViewBody({
    super.key,
    required this.resultModel,
  });

  final ResultModel resultModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(
              top: 23,
              bottom: 26,
              left: kHorPadding - 10,
              right: kHorPadding - 10),
          sliver: SliverAppBar(
            automaticallyImplyLeading: false,
            title: ResultProductAppBar(search: resultModel.search),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        ProductItemsResultFetchData(
          products: resultModel.products,
        )
      ],
    );
  }
}

//  const 