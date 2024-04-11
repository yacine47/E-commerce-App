import 'package:ecommerce_app/core/helpers/list_navigation_bar.dart';
import 'package:ecommerce_app/features/seller_features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeClientView extends StatefulWidget {
  const HomeClientView({super.key});
  static String path = '/HomeClientView';

  @override
  State<HomeClientView> createState() => _HomeClientViewState();
}

class _HomeClientViewState extends State<HomeClientView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
      ),
      body: SafeArea(
        child: NavigationView.navigationViewsClient[_currentIndex],
      ),
    );
  }
}


// (index) {
//             _currentIndex = index;
//             setState(() {});
//           },