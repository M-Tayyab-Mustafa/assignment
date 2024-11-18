// ignore_for_file: use_build_context_synchronously

import '../../export.dart';

class LoginUsingGithub implements ParamsUseCase<UserModel?, BuildContext> {
  LoginUsingGithub._privateConstructor();
  factory LoginUsingGithub() => LoginUsingGithub._privateConstructor();
  static LoginUsingGithub get instance => LoginUsingGithub();

  @override
  FutureOr<UserModel?> call(BuildContext context) async {
    await dotenv.load();
    var userModel = await LoginRepoImp.instance.loginUsingGithub(context);
    dotenv.clean();
    return userModel;
  }
}
