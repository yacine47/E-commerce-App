import 'package:ecommerce_app/core/utils/app_router.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/my_assets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: MyAssets.fontFamilyGilroy,
        primaryColor: MyColors.primaryColor,
      ),
    );
  }
}
