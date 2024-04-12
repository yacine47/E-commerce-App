import 'package:ecommerce_app/core/helpers/profil_properties.dart';
import 'package:ecommerce_app/core/widgets/circle_background.dart';
import 'package:ecommerce_app/core/widgets/custom_card_item_height.dart';
import 'package:ecommerce_app/core/widgets/custom_profil_items.dart';
import 'package:ecommerce_app/core/widgets/profil_info.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleBackground(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 28),
          CustomCardItemHasHeight(
            hieght: MediaQuery.of(context).size.height * .32,
            child: const ProfilInfo(),
          ),
          const SizedBox(height: 28),
          ListView.separated(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => CustomCardItemHasHeight(
              hieght: 68,
              child: CustomProfielItems(
                title: ProfileProperties.listProfileProperties[index].title,
                subTitle:
                    ProfileProperties.listProfileProperties[index].subTitle,
                icon: ProfileProperties.listProfileProperties[index].icon,
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10.5,
            ),
            itemCount: ProfileProperties.listProfileProperties.length,
          )
        ],
      ),
    );
  }
}
