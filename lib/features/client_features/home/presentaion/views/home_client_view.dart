import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/home_client_view_body.dart';
import 'package:flutter/material.dart';

class HomeClientView extends StatelessWidget {
  const HomeClientView({super.key});
  static String path = '/HomeClientView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HomeClientViewBody()),
    );
  }
}
