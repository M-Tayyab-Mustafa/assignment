import '../export.dart';

class ScreenTransition {
  ScreenTransition._privateConstructor();

  static GoRoute screenFadeTransition({
    required String name,
    required NavPageBuilder pageBuilder,
    List<RouteBase> routes = const <RouteBase>[],
    ExitCallback? onExit,
  }) {
    return GoRoute(
      name: name,
      path: name,
      routes: routes,
      onExit: onExit,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: pageBuilder.call(context, state),
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
      ),
    );
  }
}
