import '../../export.dart';
part '_event.dart';
part '_state.dart';

class LoginSuccessBloc extends Bloc<LoginSuccessEvent, LoginSuccessState> {
  final UserModel user;
  final BuildContext context;
  LoginSuccessBloc(this.context, {required this.user}) : super(const LoginSuccessState()) {
    on<LoginSuccessInit>(_loginSuccessInit);
    add(LoginSuccessInit());
  }

  FutureOr<void> _loginSuccessInit(LoginSuccessInit event, Emitter<LoginSuccessState> emit) {
    emit(state.copyWith(isLoading: false));
  }
}
