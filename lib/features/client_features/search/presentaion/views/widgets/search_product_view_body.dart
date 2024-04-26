import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/features/client_features/search/data/models/result_model.dart';
import 'package:ecommerce_app/features/client_features/search/presentaion/view_models/search_product_cubit/search_product_cubit.dart';
import 'package:ecommerce_app/features/client_features/search/presentaion/views/result_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class SearchProductViewBody extends StatelessWidget {
  const SearchProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemHasPadding(
      horPadding: kHorPadding,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomTextFromField(
                  onFieldSubmitted: (value) async {
                    if (value.isNotEmpty) {
                      BlocProvider.of<SearchProductCubit>(context).search =
                          value;
                      await BlocProvider.of<SearchProductCubit>(context)
                          .searchProduct();
                    }
                  },
                  autofocus: true,
                  borderColor: Colors.black.withOpacity(0.2),
                  hint: 'Search Product',
                  prefixIcon: IconlyLight.search,
                  borderRaduis: 16,
                  contentPadding: const EdgeInsets.only(
                      bottom: 14, top: 14, left: 18, right: 18),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => GoRouter.of(context).pop(),
                child: Text('Cancel',
                    style: Styles.style16.copyWith(
                      color: MyColors.hintColorTextField,
                    )),
              )
            ],
          ),

          BlocListener<SearchProductCubit, SearchProductState>(
            listener: (context, state) {
              if (state is SearchProductSuccess) {
                GoRouter.of(context).pushReplacement(ResultProductView.path,
                    extra: ResultModel(
                      products: state.products,
                      search:
                          BlocProvider.of<SearchProductCubit>(context).search,
                    ));
              }
            },
            child: const SizedBox(),
          ),
          // Stepper(
          //   connectorColor: MaterialStatePropertyAll(MyColors.primaryColor),
          //   steps: const [
          //     Step(
          //       title: Text('Order Placed'),
          //       content: Text('Your order has been placed'),
          //     ),
          //     Step(
          //       title: Text('Preparing'),
          //       content: Text('Your order is being prepared'),
          //     ),
          //     Step(
          //       title: Text('On the way'),
          //       content: Text('Our delivery executive is on the way'),
          //     ),
          //     Step(
          //       title: Text('Delivered'),
          //       content: Text('Your order was delivered successfully'),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
