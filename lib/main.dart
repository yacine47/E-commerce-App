import 'package:ecommerce_app/core/utils/app_router.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/my_assets.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setup();
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(
        fontFamily: MyAssets.fontFamilyGilroy,
        // fontFamily: MyAssets.fontFamilyUrbanist,
        // textTheme: GoogleFonts.urbanistTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primaryColor),
      ),
    );
  }
}
