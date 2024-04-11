import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class ProfilInfo extends StatelessWidget {
  const ProfilInfo(
      {super.key,
      this.photo = 'https://cdn-icons-png.flaticon.com/512/5556/5556468.png'});
  final String photo;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(555),
          child: Image.network(
            photo,
            alignment: const Alignment(0, .6),
            fit: BoxFit.cover,
            width: 98,
            height: 98,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Ayejoto Neslon',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: MyColors.primaryColor,
          ),
        ),
        const Text(
          '+213-558769547',
          style: TextStyle(
            fontSize: 12,
            letterSpacing: .2,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
