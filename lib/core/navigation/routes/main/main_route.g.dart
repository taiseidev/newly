// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $policyRoute,
      $activityDetailRoute,
      $calendarRoute,
      $contactRoute,
      $startRoute,
      $mainRoute,
    ];

RouteBase get $policyRoute => GoRouteData.$route(
      path: '/policy',
      parentNavigatorKey: PolicyRoute.$parentNavigatorKey,
      factory: $PolicyRouteExtension._fromState,
    );

extension $PolicyRouteExtension on PolicyRoute {
  static PolicyRoute _fromState(GoRouterState state) => const PolicyRoute();

  String get location => GoRouteData.$location(
        '/policy',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $activityDetailRoute => GoRouteData.$route(
      path: '/activity_detail',
      parentNavigatorKey: ActivityDetailRoute.$parentNavigatorKey,
      factory: $ActivityDetailRouteExtension._fromState,
    );

extension $ActivityDetailRouteExtension on ActivityDetailRoute {
  static ActivityDetailRoute _fromState(GoRouterState state) =>
      const ActivityDetailRoute();

  String get location => GoRouteData.$location(
        '/activity_detail',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $calendarRoute => GoRouteData.$route(
      path: '/calendar',
      parentNavigatorKey: CalendarRoute.$parentNavigatorKey,
      factory: $CalendarRouteExtension._fromState,
    );

extension $CalendarRouteExtension on CalendarRoute {
  static CalendarRoute _fromState(GoRouterState state) => const CalendarRoute();

  String get location => GoRouteData.$location(
        '/calendar',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $contactRoute => GoRouteData.$route(
      path: '/contact',
      parentNavigatorKey: ContactRoute.$parentNavigatorKey,
      factory: $ContactRouteExtension._fromState,
    );

extension $ContactRouteExtension on ContactRoute {
  static ContactRoute _fromState(GoRouterState state) => const ContactRoute();

  String get location => GoRouteData.$location(
        '/contact',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $startRoute => GoRouteData.$route(
      path: '/start',
      parentNavigatorKey: StartRoute.$parentNavigatorKey,
      factory: $StartRouteExtension._fromState,
    );

extension $StartRouteExtension on StartRoute {
  static StartRoute _fromState(GoRouterState state) => const StartRoute();

  String get location => GoRouteData.$location(
        '/start',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $mainRoute => StatefulShellRouteData.$route(
      parentNavigatorKey: MainRoute.$parentNavigatorKey,
      restorationScopeId: MainRoute.$restorationScopeId,
      factory: $MainRouteExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          navigatorKey: HomeBranch.$navigatorKey,
          restorationScopeId: HomeBranch.$restorationScopeId,
          routes: [
            GoRouteData.$route(
              path: '/home',
              factory: $HomeRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: SearchBranch.$navigatorKey,
          restorationScopeId: SearchBranch.$restorationScopeId,
          routes: [
            GoRouteData.$route(
              path: '/search',
              factory: $SearchRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: CommunityBranch.$navigatorKey,
          restorationScopeId: CommunityBranch.$restorationScopeId,
          routes: [
            GoRouteData.$route(
              path: '/community',
              factory: $CommunityRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $MainRouteExtension on MainRoute {
  static MainRoute _fromState(GoRouterState state) => const MainRoute();
}

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SearchRouteExtension on SearchRoute {
  static SearchRoute _fromState(GoRouterState state) => const SearchRoute();

  String get location => GoRouteData.$location(
        '/search',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CommunityRouteExtension on CommunityRoute {
  static CommunityRoute _fromState(GoRouterState state) =>
      const CommunityRoute();

  String get location => GoRouteData.$location(
        '/community',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
