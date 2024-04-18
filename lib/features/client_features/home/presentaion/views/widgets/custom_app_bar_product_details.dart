import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/go_back_button.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class CustomAppBarProductDetails extends StatefulWidget {
  const CustomAppBarProductDetails({super.key});

  @override
  State<CustomAppBarProductDetails> createState() =>
      _CustomAppBarProductDetailsState();
}

class _CustomAppBarProductDetailsState
    extends State<CustomAppBarProductDetails> {
  bool favoriteIsActive = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorPadding),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const GoBackButton(),
            CustomIconButton(
              onTap: () {
                setState(() {
                  if (favoriteIsActive) {
                    favoriteIsActive = false;
                  } else {
                    favoriteIsActive = true;
                  }
                });
              },
              iconName: favoriteIsActive ? kFavoriteIconActive : kFavoriteIcon,
              color: favoriteIsActive ? Colors.red : Colors.black,
              padRight: 0,
            ),
          ],
        ),
      ),
    );
  }
}
