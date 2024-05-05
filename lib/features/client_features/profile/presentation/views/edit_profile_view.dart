import 'package:ecommerce_app/features/client_features/profile/presentation/views/widgets/edit_profile_view_body.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  static String path = '/EditProfileView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: EditProfileViewBody(),
      ),
    );
  }
}
