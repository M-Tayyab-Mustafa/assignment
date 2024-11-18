part of '_bloc.dart';

@immutable
sealed class PassKeyEvent {}

final class PassKeyInit extends PassKeyEvent {}

final class CancelScanning extends PassKeyEvent {}
