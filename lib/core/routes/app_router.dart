import 'package:go_router/go_router.dart';
import 'package:ts/core/routes/app_routes.dart';
import 'package:ts/features/auth/presentation/screens/account_registration_screen.dart';
import 'package:ts/features/auth/presentation/screens/login_screen.dart';
import 'package:ts/features/auth/presentation/screens/signup_screen.dart';

import '../../features/on_boarding/presentation/screens/on_boarding_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.splash,

    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.onBoarding,
        name: AppRoutes.onBoarding,
        builder: (context, state) {
          return OnBoardingScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.account,
        name: AppRoutes.account,
        builder: (context, state) {
          return AccountRegistrationScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.login,
        builder: (context, state) {
          return LoginScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.signUp,
        name: AppRoutes.signUp,
        builder: (context, state) {
          return SignupScreen();
        },
      ),
    ],
  );
}
