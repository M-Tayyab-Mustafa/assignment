// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '_bloc.dart';

@immutable
final class AuthenticationState {
  final bool isLoading;

  const AuthenticationState({
    this.isLoading = true,
  });

  AuthenticationState copyWith({
    bool? isLoading,
  }) {
    return AuthenticationState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
