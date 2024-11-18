// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '_bloc.dart';

@immutable
final class LoginState {
  final GlobalKey<FormState>? formKey;
  final bool isLoading;
  final bool isPasswordObscured;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  const LoginState({
    this.formKey,
    this.isLoading = true,
    this.emailController,
    this.passwordController,
    this.isPasswordObscured = true,
  });

  LoginState copyWith({
    GlobalKey<FormState>? formKey,
    bool? isLoading,
    bool? isPasswordObscured,
    TextEditingController? emailController,
    TextEditingController? passwordController,
  }) {
    return LoginState(
      formKey: formKey ?? this.formKey,
      isLoading: isLoading ?? this.isLoading,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
    );
  }
}
