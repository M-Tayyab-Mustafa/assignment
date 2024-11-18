// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '_bloc.dart';

@immutable
final class CallerIDAppState {
  final bool isLoading;

  const CallerIDAppState({
    this.isLoading = true,
  });

  CallerIDAppState copyWith({
    bool? isLoading,
  }) {
    return CallerIDAppState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
