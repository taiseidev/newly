import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nost/core/const/navigation.dart';
import 'package:nost/core/ui/pages/home/home_page.dart';

/// NavigatorKey
final homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');

const homeStatefulShellBranch = TypedStatefulShellBranch<HomeBranch>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRoute>(
      path: MainRouteConst.homeRoutePath,
    ),
  ],
);

final class HomeBranch extends StatefulShellBranchData {
  const HomeBranch();

  static final GlobalKey<NavigatorState> $navigatorKey = homeNavigatorKey;
  static const String $restorationScopeId = 'homeRestorationScopeId';
}

final class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}
