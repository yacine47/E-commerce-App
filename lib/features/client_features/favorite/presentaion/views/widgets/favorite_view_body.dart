import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/client_features/favorite/presentaion/views/widgets/product_item_favorite_fetch_data.dart';
import 'package:flutter/material.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(top: 23, bottom: 26),
          sliver: SliverAppBar(
            title: Center(
              child: Text(
                'Favorite',
                style: Styles.style24,
                textAlign: TextAlign.center,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
        const ProductItemsFavoriteFetchData()
      ],
    );
  }
}
