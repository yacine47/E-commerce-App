import 'package:ecommerce_app/core/helpers/list_navigation_bar.dart';
import 'package:ecommerce_app/features/admin_features/home/presentation/views/widgets/custom_bottom_navigation_bar_admin.dart';
import 'package:flutter/material.dart';

class HomeAdminView extends StatefulWidget {
  const HomeAdminView({super.key});

  static String path = '/HomeAdminView';

  @override
  State<HomeAdminView> createState() => _HomeAdminViewState();
}

class _HomeAdminViewState extends State<HomeAdminView> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: CustomBottomNavigationBarAdmin(
        currentIndex: _currentIndex,
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
      ),
      body: SafeArea(
        child: NavigationView.navigationViewAdmin[_currentIndex],
      ),
    );
  }
}
