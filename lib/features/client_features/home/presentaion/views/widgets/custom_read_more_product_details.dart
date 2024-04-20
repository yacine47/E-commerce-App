import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CustomReadMoreProductDetails extends StatelessWidget {
  const CustomReadMoreProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte',
      trimLines: 3,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Read More.',
      trimExpandedText: ' Show Less.',
      style: Styles.style14.copyWith(height: 1.6, fontWeight: FontWeight.w600),
      moreStyle: Styles.style14
          .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
      lessStyle: Styles.style14
          .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
}
