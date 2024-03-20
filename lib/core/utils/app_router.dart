import 'package:ecommerce_app/features/authentication/presentation/views/login_view.dart';
import 'package:ecommerce_app/features/introduction_screen/presentation/views/introduction_screen_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: IntroductionScreenView.path,
    routes: [
      GoRoute(
        path: IntroductionScreenView.path,
        builder: (context, state) => const IntroductionScreenView(),
      ),
      GoRoute(
        path: LoginView.path,
        builder: (context, state) => const LoginView(),
      ),
    ],
  );
}
