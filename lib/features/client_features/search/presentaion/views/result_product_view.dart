import 'package:ecommerce_app/features/client_features/search/data/models/result_model.dart';
import 'package:ecommerce_app/features/client_features/search/presentaion/views/widgets/result_product_view_body.dart';
import 'package:flutter/material.dart';

class ResultProductView extends StatelessWidget {
  const ResultProductView({super.key, required this.resultModel});

  final ResultModel resultModel;

  static String path = '/ResultProductView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResultProductViewBody(resultModel: resultModel),
      ),
    );
  }
}
