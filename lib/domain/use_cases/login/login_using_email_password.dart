import '../../export.dart';

class LoginUsingEmailPasswordUseCase implements ParamsUseCase<UserModel?, LoginParams> {
  LoginUsingEmailPasswordUseCase._privateConstructor();
  factory LoginUsingEmailPasswordUseCase() => LoginUsingEmailPasswordUseCase._privateConstructor();
  static LoginUsingEmailPasswordUseCase get instance => LoginUsingEmailPasswordUseCase();

  @override
  FutureOr<UserModel?> call(LoginParams params) async {
    return await LoginRepoImp.instance.loginUsingEmailPassword(params);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
