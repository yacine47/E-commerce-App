import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/home_client_view_body.dart';
import 'package:ecommerce_app/core/widgets/profil_view_body.dart';
import 'package:ecommerce_app/features/seller_features/home/presentation/views/widgets/home_seller_view_body.dart';
import 'package:flutter/material.dart';

abstract class NavigationView {
  static List<Widget> navigationViewsClient = [
    const HomeClientViewBody(),
    const HomeClientViewBody(),
    const HomeClientViewBody(),
    const ProfileViewBody(),
  ];

  static List<Widget> navigationViewSeller = [
    const HomeSellerViewBody(),
    const HomeSellerViewBody(),
    const HomeSellerViewBody(),
    const ProfileViewBody(),
  ];
}
