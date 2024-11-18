// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '_bloc.dart';

@immutable
final class DashboardState {
  final bool isLoading;

  const DashboardState({
    this.isLoading = true,
  });

  DashboardState copyWith({
    bool? isLoading,
  }) {
    return DashboardState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
