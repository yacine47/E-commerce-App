import 'package:ecommerce_app/features/client_features/favorite/presentaion/views/widgets/favorite_view_body.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  static String path = '/FavoriteViewBody';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: FavoriteViewBody(),
      ),
    );
  }
}
