

import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/all_order_item_delivred_count_cubit/all_order_item_delivred_count_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoificationCountFetchData extends StatelessWidget {
  const NoificationCountFetchData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllOrderItemDelivredCountCubit,
        AllOrderItemDelivredCountState>(
      builder: (context, state) {
        if (state is AllOrderItemDelivredCountSuccess) {
          return Text('${state.count}');
        }
        return const Text('0');
      },
    );
  }
}