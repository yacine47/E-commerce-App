import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/bottom_bar_product_details.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_app_bar_product_details.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_image_slider.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_rate_card.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_read_more_product_details.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Stack(
                children: [
                  const CustomImageSlider(),
                  Positioned(
                    top: 23,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const CustomAppBarProductDetails()),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kHorPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomRateCard(),
                    const SizedBox(height: 3),
                    Text('Iphone 15 prx max', style: Styles.style24),
                    const SizedBox(height: 10),
                    const CustomReadMoreProductDetails(),
                    const SizedBox(height: 21),
                    Text('Size', style: Styles.style18),
                    // const Row(
                    //   children: [
                    //     SizedProductItem(hint: 'S'),
                    //     SizedProductItem(hint: 'M'),
                    //     SizedProductItem(hint: 'L'),
                    //     SizedProductItem(hint: 'XL'),
                    //   ],
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
        BottomBarProductDetails(
          onPressed: () {},
        ),
      ],
    );
  }
}

// class SizedProductItem extends StatelessWidget {
//   const SizedProductItem({
//     super.key,
//     required this.hint,
//   });
//   final String hint;

//   @override
//   Widget build(BuildContext context) {
//     return CircleAvatar(
//       radius: 15,
//       backgroundColor: Colors.black,
//       child: CircleAvatar(
//         radius: 13,
//         backgroundColor: Colors.white,
//         child: Text(
//           hint,
//           style: Styles.style16
//               .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
//         ),
//       ),
//     );
//   }
// }
