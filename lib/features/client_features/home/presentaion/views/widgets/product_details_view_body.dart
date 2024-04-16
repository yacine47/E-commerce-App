import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_app_bar_product_details.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_image_slider.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_rate_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            const CustomImageSlider(),
            Positioned(
              top: 34,
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Laptop Vivo Book 15',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomRateCard(),
                ],
              ),
              const SizedBox(height: 28),
              ReadMoreText(
                'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte',
                trimLines: 6,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Read More.',
                trimExpandedText: ' Show Less',
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.7,
                ),
                moreStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: MyColors.primaryColor,
                ),
                lessStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: MyColors.primaryColor,
                ),
              ),

              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push('location');
                },
                child: Text('All Reviews',
                    style: Styles.style16.copyWith(
                      color: MyColors.primaryColor,
                    )),
              ),

              const SizedBox(height: 22),
              // CustomTitleItems(
              //   onTap: () {},
              //   defaultPadding: false,
              //   title: 'Reviews',
              // ),
              // const SizedBox(
              //   height: 16,
              // ),
              // const CustomReviewListView(
              //   itemCount: 2,
              // ),
              // const Divider(thickness: 0.5),
              // const SizedBox(height: 8),
              // const SizedBox(
              //   height: 26,
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
