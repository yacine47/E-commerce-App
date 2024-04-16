import 'package:ecommerce_app/core/widgets/custom_photo_profile.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/views/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';

class CustomReviewItem extends StatelessWidget {
  const CustomReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomPhotoProfile(
                photo: 'assets/images/prfil_avatar.png',
                size: 39,
              ),
              SizedBox(width: 10),
              Text(
                'Alex Brown',
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(height: 12),
          CustomRatingBar(
            itemSize: 16,
          ),
          SizedBox(width: 12),
          Text(
            '24-Aug-2023',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'I am genuinely impressed with the app design and the variety of products available. The filter and sort features have made shopping so much easier for me!',
            style: TextStyle(
              // fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class CustomPhotoProfil {
  const CustomPhotoProfil();
}
