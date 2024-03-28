import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButtonSubmit extends StatelessWidget {
  const CustomButtonSubmit(
      {super.key,
      this.onPressed,
      required this.title,
      this.isLoadingState = false});
  final void Function()? onPressed;
  final String title;
  final bool isLoadingState;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(555),
        border: Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff00CDBD).withOpacity(.2),
            offset: const Offset(6, 6),
            blurRadius: 20,
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primaryColor,
        ),
        child: isLoadingState == false
            ? Text(
                title,
                style: Styles.style16,
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
