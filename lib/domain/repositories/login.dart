import '../export.dart';

abstract class LoginRepoAbst {
  FutureOr<UserModel?> loginUsingEmailPassword(LoginParams loginParams);

  FutureOr<UserModel?> loginUsingGoogle();

  FutureOr<UserModel?> loginUsingGithub(BuildContext context);
}
