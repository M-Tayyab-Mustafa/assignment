import '../../export.dart';

class LoginUsingGoogle implements UseCase<UserModel?> {
  LoginUsingGoogle._privateConstructor();
  factory LoginUsingGoogle() => LoginUsingGoogle._privateConstructor();
  static LoginUsingGoogle get instance => LoginUsingGoogle();

  @override
  FutureOr<UserModel?> call() async {
    return await LoginRepoImp.instance.loginUsingGoogle();
  }
}
