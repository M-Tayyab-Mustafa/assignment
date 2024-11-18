import '../export.dart';

class RouterConfiguration {
  RouterConfiguration._privateConstructor();

  static GoRouter get routerConfig => GoRouter(
        initialLocation: RouteName.login,
        routes: [
          ScreenTransition.screenFadeTransition(
            name: RouteName.login,
            pageBuilder: (context, state) => BlocProvider(create: (context) => LoginBloc(context), child: const LoginPage()),
          ),
          ScreenTransition.screenFadeTransition(
            name: RouteName.passKey,
            pageBuilder: (context, state) => BlocProvider(create: (context) => PassKeyBloc(context), child: const PassKeyPage()),
          ),
          ScreenTransition.screenFadeTransition(
            name: RouteName.loginSuccess,
            pageBuilder: (context, state) => BlocProvider(create: (context) => LoginSuccessBloc(context, user: state.extra as UserModel), child: const LoginSuccessPage()),
          ),
          ScreenTransition.screenFadeTransition(
            name: RouteName.dashboard,
            pageBuilder: (context, state) => BlocProvider(create: (context) => DashboardBloc(), child: const DashboardPage()),
            routes: [
              ScreenTransition.screenFadeTransition(
                name: RouteName.authentication,
                pageBuilder: (context, state) => BlocProvider(create: (context) => AuthenticationBloc(), child: const AuthenticationPage()),
              ),
              ScreenTransition.screenFadeTransition(
                name: RouteName.callerIDApp,
                pageBuilder: (context, state) => BlocProvider(create: (context) => CallerIDAppBloc(), child: const CallerIDAppPage()),
              ),
            ],
          ),
        ],
      );
}
