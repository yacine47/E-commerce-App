import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_app_bar_product_details.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_image_slider.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_rate_card.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/views/product_reviews_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                const SizedBox(height: 6),
                Text('Iphone 15 prx max', style: Styles.style24),

                const SizedBox(height: 10),
                ReadMoreText(
                  'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte',
                  trimLines: 3,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read More.',
                  trimExpandedText: ' Show Less',
                  style: Styles.style14.copyWith(height: 1.6),
                  moreStyle: Styles.style14.copyWith(color: Colors.black),
                  lessStyle: Styles.style14.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 12),
                // Text('Size', style: Styles.style18)
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
      ),
    );
  }
}
