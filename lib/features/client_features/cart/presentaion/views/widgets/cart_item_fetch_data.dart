import 'package:ecommerce_app/core/widgets/custom_failure_widget.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_widget.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/product_cart_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/cart_items_list_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class CartItemFetchData extends StatelessWidget {
  const CartItemFetchData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCartCubit, ProductCartState>(
      builder: (context, state) {
        if (state is ProductCartSuccess) {
          print(Hive.box('settings').get('token'));
          return CartItemsListView(
            products: state.products,
          );
        } else if (state is ProductCartFailure) {
          print(Hive.box('settings').get('token'));
          return CustomFailureWidget(errMessage: state.errMessage);
        }
        return const CustomLoadingWidget();
      },
    );
  }
}
