import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nost/core/const/navigation.dart';
import 'package:nost/core/navigation/router/router.dart';
import 'package:nost/core/navigation/routes/branches/community_branch.dart';
import 'package:nost/core/navigation/routes/branches/home_branch.dart';
import 'package:nost/core/navigation/routes/branches/search_branch.dart';
import 'package:nost/ui/bottom_navigation/scaffold_with_nav_bar.dart';
import 'package:nost/ui/start/start_page.dart';

part 'main_route.g.dart';

@TypedGoRoute<PolicyRoute>(
  path: PolicyRouteConst.policyRoutePath,
)
class PolicyRoute extends GoRouteData {
  const PolicyRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SizedBox.shrink();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
}

@TypedGoRoute<ContactRoute>(
  path: ContactRouteConst.contactRoutePath,
)
class ContactRoute extends GoRouteData {
  const ContactRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SizedBox.shrink();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
}

@TypedGoRoute<StartRoute>(
  path: StartRouteConst.startRoutePath,
)
class StartRoute extends GoRouteData {
  const StartRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const StartPage();

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
}

@TypedStatefulShellRoute<MainRoute>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    homeStatefulShellBranch,
    searchStatefulShellBranch,
    communityStatefulShellBranch,
  ],
)
final class MainRoute extends StatefulShellRouteData {
  const MainRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return ScaffoldWithNavBar(
      navigationShell: navigationShell,
    );
  }

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;
  static const String $restorationScopeId = 'mainRouteRestorationScopeId';
}
