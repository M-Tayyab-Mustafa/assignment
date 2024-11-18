part of '_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginInit extends LoginEvent {}

final class TogglePasswordObscurity extends LoginEvent {}

final class SignIn extends LoginEvent {}

final class FingerPrintLogin extends LoginEvent {}

final class GoogleLogin extends LoginEvent {}

final class GithubLogin extends LoginEvent {
  final BuildContext context;

  GithubLogin({required this.context});
}

final class RegisterAccount extends LoginEvent {}
