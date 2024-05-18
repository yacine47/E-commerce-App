import 'package:ecommerce_app/core/helpers/list_navigation_bar.dart';
import 'package:ecommerce_app/features/seller_features/home/presentation/views/widgets/custom_bottom_navigation_bar_seller.dart';
import 'package:flutter/material.dart';

class HomeSellerView extends StatefulWidget {
  const HomeSellerView({super.key});
  static String path = '/HomeSellerView';

  @override
  State<HomeSellerView> createState() => _HomeSellerViewState();
}

class _HomeSellerViewState extends State<HomeSellerView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(555),
        ),
        onPressed: () {
          // GoRouter.of(context).push(CartView.path);
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBarSeller(
        currentIndex: _currentIndex,
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
      ),
      body: SafeArea(
        child: NavigationView.navigationViewSeller[_currentIndex],
      ),
    );
  }
}


// BlocProvider<CategoryCubit>(
//               create: (context) =>
//                   CategoryCubit(getIt.get<HomeClientRepoImpl>())
//                     ..homeClientRepo.getAllCategories(),
//             ),


// (index) {
//             _currentIndex = index;
//             setState(() {});
//           },