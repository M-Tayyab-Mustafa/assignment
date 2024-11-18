import '../../export.dart';
part '_event.dart';
part '_state.dart';

class PassKeyBloc extends Bloc<PassKeyEvent, PassKeyState> {
  final BuildContext context;
  final LocalAuthentication auth = LocalAuthentication();
  PassKeyBloc(this.context) : super(const PassKeyState()) {
    on<PassKeyInit>(_passKeyInit);
    on<CancelScanning>(_cancelScanning);
    add(PassKeyInit());
  }
  FutureOr<void> _passKeyInit(PassKeyInit event, Emitter<PassKeyState> emit) async {
    try {
      final bool canAuthenticate = (await auth.canCheckBiometrics) || (await auth.isDeviceSupported());
      if (canAuthenticate) {
        final List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();
        if (availableBiometrics.contains(BiometricType.strong)) {
          final bool didAuthenticate = await auth.authenticate(
            localizedReason: ' ',
            options: const AuthenticationOptions(
              biometricOnly: true,
              stickyAuth: true,
              sensitiveTransaction: true,
            ),
          );
          if (didAuthenticate) {
            AppHelper.showInfoToast('Login successful');
          } else {
            if (!context.mounted) return;
            context.pop();
          }
        } else {
          AppHelper.showInfoToast('$availableBiometrics');
        }
      }
      emit(state.copyWith(isLoading: false));
    } catch (error) {
      log(error.toString());
    }
  }

  FutureOr<void> _cancelScanning(CancelScanning event, Emitter<PassKeyState> emit) {
    context.pop();
  }
}
