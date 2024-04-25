import 'package:ecommerce_app/features/client_features/home/presentaion/views/home_client_view.dart';
import 'package:ecommerce_app/features/introduction_screen/presentation/views/introduction_screen_view.dart';
import 'package:ecommerce_app/features/seller_features/home/presentation/views/home_seller_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

String initRoute() {
  Box setings = Hive.box('settings');
  // bool isExiste =  setings.get('token') == null;

  if (setings.get('token') != null) {
    if (setings.get('role') == 'client') {
      return HomeClientView.path;
    }
    return HomeSellerView.path;
  }

  return IntroductionScreenView.path;
}
