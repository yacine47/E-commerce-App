



import 'package:ecommerce_app/constants.dart';

class ProfileProperties {
  final String title;
  final String subTitle;
  final String icon;

  ProfileProperties(
      {required this.title, required this.subTitle, required this.icon});

  static List<ProfileProperties> listProfileProperties = [
    ProfileProperties(
      title: 'Profiel Settings',
      subTitle: 'Update and modify your profil',
      icon: kCartIconify,
    ),
    ProfileProperties(
      title: 'Privacy',
      subTitle: 'Change your password',
      icon: kCartIconify,
    ),
    ProfileProperties(
      title: 'My Places',
      subTitle: 'Update and modify your Places',
      icon: kCartIconify,
    ),
    ProfileProperties(
      title: 'Log Out',
      subTitle: 'Sign in into another account',
      icon: kCartIconify,
    ),
  ];
}
