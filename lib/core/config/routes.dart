import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/constants/app_strings.dart';
import 'package:news_app/features/auth/presentation/view/login_view.dart';
import 'package:news_app/features/auth/presentation/view/register_view.dart';
import 'package:news_app/features/auth/presentation/view_model/cubit.dart';
import 'package:news_app/features/home/presentation/view/home_view.dart';
import 'package:news_app/features/home/presentation/view_model/cubit.dart';
import 'package:news_app/injection_container.dart' as di;
import 'package:news_app/splash_screen.dart';

class Routes {
  static const String homeRoute = '/homeRoute';
  static const String initialRoute = '/';
  static const String loginRoute = '/loginRoute';
  static const String registerRoute = '/registerRoute';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: ((_) {
            return const SplashScreen();
          }),
        );

      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: ((_) {
            return BlocProvider(
              create: (context) => di.sl<HomeCubit>(),
              child: HomeView(),
            );
          }),
        );

      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: ((_) {
            return BlocProvider(
              create: ((context) => di.sl<AuthCubit>()),
              child: const LoginView(),
            );
          }),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: ((_) {
            return BlocProvider(
              create: ((context) => di.sl<AuthCubit>()),
              child: const RegisterView(),
            );
          }),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder:
          ((context) => const Scaffold(
            body: Center(child: Text(AppStrings.noRouteFound)),
          )),
    );
  }
}
