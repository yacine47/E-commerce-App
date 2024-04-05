import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconly/iconly.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      height: 66,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          // landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          // mouseCursor: MouseCursor.defer,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            _currentIndex = index;
            setState(() {});
          },
          backgroundColor: Colors.white,
          iconSize: 22,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 16,

          // unselectedItemColor: primaryColor,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                IconlyLight.home,
                size: kSizeIconNoActive,
              ),
              activeIcon: Icon(
                IconlyBold.home,
                size: kSizeIconActive,
                color: MyColors.primaryColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                IconlyLight.heart,
                size: kSizeIconNoActive,
              ),
              activeIcon: Icon(
                IconlyBold.heart,
                size: kSizeIconActive,
                color: MyColors.primaryColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Iconify(
                kCartIconify,
                size: kSizeIconNoActive + 4,
                color: MyColors.iconColorNavigationBar,
              ),
              activeIcon: Iconify(
                kCartIconifyActive,
                size: kSizeIconNoActive + 8,
                color: MyColors.primaryColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                IconlyLight.profile,
                size: kSizeIconNoActive,
              ),
              activeIcon: Icon(
                IconlyBold.profile,
                size: kSizeIconActive,
                color: MyColors.primaryColor,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
