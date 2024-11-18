// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '_bloc.dart';

@immutable
final class LoginSuccessState {
  final bool isLoading;

  const LoginSuccessState({
    this.isLoading = true,
  });

  LoginSuccessState copyWith({
    bool? isLoading,
  }) {
    return LoginSuccessState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
