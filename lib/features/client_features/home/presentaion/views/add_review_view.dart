import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/add_review_view_body.dart';
import 'package:flutter/material.dart';

class AddReviewView extends StatelessWidget {
  const AddReviewView({super.key});

  static String path = '/AddReviewView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AddReviewViewBody(),
      ),
    );
  }
}
