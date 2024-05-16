import 'package:ecommerce_app/core/helpers/list_navigation_bar.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/all_order_item_delivred_count_cubit/all_order_item_delivred_count_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/custom_bottom_navigation_bar_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeClientView extends StatefulWidget {
  const HomeClientView({super.key});
  static String path = '/HomeClientView';

  @override
  State<HomeClientView> createState() => _HomeClientViewState();
}

class _HomeClientViewState extends State<HomeClientView> {
  @override
  void initState() {
    BlocProvider.of<AllOrderItemDelivredCountCubit>(context)
        .getAllOrderItemDelivredCount();
    super.initState();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBarClient(
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


// BlocProvider<CategoryCubit>(
//               create: (context) =>
//                   CategoryCubit(getIt.get<HomeClientRepoImpl>())
//                     ..homeClientRepo.getAllCategories(),
//             ),


// (index) {
//             _currentIndex = index;
//             setState(() {});
//           },