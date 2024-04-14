import 'package:flutter/material.dart';

class CustomRateCard extends StatelessWidget {
  const CustomRateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(555),
          border: const Border.symmetric(
            horizontal: BorderSide(),
            vertical: BorderSide(),
          )),
      child: const Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.orange,
            size: 15,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            '4.5',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            ' (1419)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
