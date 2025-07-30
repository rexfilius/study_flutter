import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_flutter/routes/routes.dart';
import 'package:study_flutter/routes/routes_branches.dart';
import 'package:study_flutter/screens/home/home_screen.dart';
import 'package:study_flutter/screens/nav/nav_screen.dart';
import 'package:study_flutter/screens/profile/profile_screen.dart';
import 'package:study_flutter/screens/splash/splash_screen.dart';
import 'package:study_flutter/screens/wallet/wallet_screen.dart';

final GlobalKey<NavigatorState> globalNavKey = GlobalKey<NavigatorState>();

final GoRouter goRouter = GoRouter(
  initialLocation: Routes.splash,
  routes: topRoutes,
);

List<RouteBase> topRoutes = [
  GoRoute(
    path: Routes.splash,
    builder: (context, state) => const SplashScreen(),
  ),
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) {
      return NavScreen(navigationShell: navigationShell);
    },
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: Routes.home,
            builder: (context, state) => HomeScreen(),
            routes: homeRoutes,
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: Routes.wallet,
            builder: (context, state) => WalletScreen(),
            routes: homeRoutes,
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: Routes.profile,
            builder: (context, state) => ProfileScreen(),
            routes: homeRoutes,
          ),
        ],
      ),
    ],
  ),
];
