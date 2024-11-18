import '../../export.dart';
part '_event.dart';
part '_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isPasswordObscured = true;
  final BuildContext context;
  LoginBloc(this.context) : super(const LoginState()) {
    on<LoginInit>(_loginInit);
    on<TogglePasswordObscurity>(_togglePasswordObscurity);
    on<SignIn>(_signIn);
    on<FingerPrintLogin>(_fingerPrintLogin);
    on<GoogleLogin>(_googleLogin);
    on<GithubLogin>(_githubLogin);
    on<RegisterAccount>(_registerAccount);
    add(LoginInit());
  }

  FutureOr<void> _loginInit(LoginInit event, Emitter<LoginState> emit) {
    emit(state.copyWith(formKey: _formKey, emailController: _emailController, passwordController: _passwordController, isPasswordObscured: isPasswordObscured, isLoading: false));
  }

  FutureOr<void> _togglePasswordObscurity(TogglePasswordObscurity event, Emitter<LoginState> emit) {
    isPasswordObscured = !isPasswordObscured;
    emit(state.copyWith(isPasswordObscured: isPasswordObscured));
  }

  FutureOr<void> _signIn(SignIn event, Emitter<LoginState> emit) async {
    if (_formKey.currentState!.validate() == false) {
      return null;
    }
    emit(state.copyWith(isLoading: true));
    FocusScope.of(context).unfocus();
    UserModel? user = await LoginUsingEmailPasswordUseCase.instance.call(LoginParams(email: _emailController.text, password: _passwordController.text));
    if (user != null) {
      if (!context.mounted) return;
      context.pushReplacementNamed(RouteName.loginSuccess, extra: user);
    } else {
      if (kDebugMode) {
        log('User is null');
      }
      emit(state.copyWith(isLoading: false));
    }
  }

  FutureOr<void> _fingerPrintLogin(FingerPrintLogin event, Emitter<LoginState> emit) async {
    await context.pushNamed(RouteName.passKey);
  }

  FutureOr<void> _googleLogin(GoogleLogin event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));
    FocusScope.of(context).unfocus();
    UserModel? user = await LoginUsingGoogle.instance.call();
    if (user != null) {
      if (!context.mounted) return;
      context.pushReplacementNamed(RouteName.loginSuccess, extra: user);
    } else {
      if (kDebugMode) {
        log('User is null');
      }
      emit(state.copyWith(isLoading: false));
    }
  }

  FutureOr<void> _githubLogin(GithubLogin event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));
    FocusScope.of(context).unfocus();
    UserModel? user = await LoginUsingGithub.instance.call(event.context);
    if (user != null) {
      if (!context.mounted) return;
      context.pushReplacementNamed(RouteName.loginSuccess, extra: user);
    } else {
      if (kDebugMode) {
        log('User is null');
      }
      emit(state.copyWith(isLoading: false));
    }
  }

  FutureOr<void> _registerAccount(RegisterAccount event, Emitter<LoginState> emit) {}
}
