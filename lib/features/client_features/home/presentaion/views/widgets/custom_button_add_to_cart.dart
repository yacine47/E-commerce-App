import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButtonAddToCart extends StatelessWidget {
  const CustomButtonAddToCart(
      {super.key, this.onPressed, this.isLoadingState = false});
  final void Function()? onPressed;
  final bool isLoadingState;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(555),
        border: Border.all(color: Colors.transparent),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primaryColor,
        ),
        child: isLoadingState == false
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                  // s
                  Text(
                    'Add to Cart',
                    style: Styles.style16.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Please Wait...',
                    style: Styles.style16,
                  ),
                ],
              ),
      ),
    );
  }
}
