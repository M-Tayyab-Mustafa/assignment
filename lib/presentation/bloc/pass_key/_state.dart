// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '_bloc.dart';

@immutable
final class PassKeyState {
  final bool isLoading;

  const PassKeyState({
    this.isLoading = true,
  });

  PassKeyState copyWith({
    bool? isLoading,
  }) {
    return PassKeyState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
