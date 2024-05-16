import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconly/iconly.dart';

class CustomBottomNavigationBarClient extends StatelessWidget {
  const CustomBottomNavigationBarClient(
      {super.key, this.onTap, required this.currentIndex});

  final void Function(int)? onTap;
  final int currentIndex;

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
          currentIndex: currentIndex,
          onTap: onTap,
          backgroundColor: Colors.white,
          iconSize: 22,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 16,

          // unselectedItemColor: primaryColor,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
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
            const BottomNavigationBarItem(
              icon: Icon(
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
              activeIcon: const Iconify(
                kCartIconifyActive,
                size: kSizeIconNoActive + 8,
                color: MyColors.primaryColor,
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
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
