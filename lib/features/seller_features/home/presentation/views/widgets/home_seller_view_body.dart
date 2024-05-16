import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomeSellerViewBody extends StatelessWidget {
  const HomeSellerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      slivers: [
        const SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 23),
              ItemHasPadding(
                  horPadding: kHorPadding,
                  child: CustomAppBar(title: 'Seller Dashbord')),
              // const SizedBox(height: 54),
              SizedBox(height: 26)
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: kHorPadding),
          sliver: SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 16,
              childAspectRatio: 2 / 2.5,
            ),
            itemCount: 3,
            itemBuilder: (context, index) => Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: Color.fromARGB(15, 0, 0, 0),
                    offset: Offset(2, 4),
                    blurStyle: BlurStyle.normal),
              ]),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 0,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      IconlyLight.bag_2,
                      size: 42,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '15',
                      style: Styles.style24,
                    ),
                    Text(
                      'Sales',
                      style: Styles.style20.copyWith(
                        color: MyColors.hintColorTextField,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )

        // Image.network(
        //     'http://10.0.2.2:8000/profile_images/users/VVF8iYxHVMBAkNVe8weH6mEuRo8fCUGHWhUWWWh9.jpg'),
      ],
    );
  }
}
