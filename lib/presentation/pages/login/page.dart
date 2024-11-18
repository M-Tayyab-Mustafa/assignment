import '../../export.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AppHelper.screenSize = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.isLoading != current.isLoading,
        builder: (context, state) {
          if (state.isLoading) {
            return const Loader();
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: AppHelper.screenSize.height,
                  width: AppHelper.screenSize.width,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/background.png',
                        height: AppHelper.screenSize.height,
                        width: AppHelper.screenSize.width,
                        fit: BoxFit.fill,
                      ),
                      Align(
                        alignment: const Alignment(0, 0.2),
                        child: Form(
                          key: state.formKey!,
                          child: GlassMorphismCard(
                            width: AppHelper.screenSize.width * 0.82,
                            child: LayoutBuilder(builder: (context, cardConstraints) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Center(child: const Text('Sprial').w900(color: CColors.white, fontSize: 26)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: AppHelper.pad_32),
                                    child: const Text('Login').w900(color: CColors.white, fontSize: 20),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: AppHelper.pad_12, bottom: AppHelper.pad_6),
                                    child: const Text('Email').w400(color: CColors.white, fontSize: 11),
                                  ),
                                  CTextFormField(
                                    controller: state.emailController!,
                                    keyboardType: TextInputType.emailAddress,
                                    hintText: 'John@gmail.com',
                                    validator: Validation.emailValidation,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: AppHelper.pad_12, bottom: AppHelper.pad_6),
                                    child: const Text('Password').w400(color: CColors.white, fontSize: 11),
                                  ),
                                  BlocBuilder<LoginBloc, LoginState>(
                                    buildWhen: (previous, current) => previous.isPasswordObscured != current.isPasswordObscured,
                                    builder: (context, state) {
                                      return CTextFormField(
                                        controller: state.passwordController!,
                                        obscureText: state.isPasswordObscured,
                                        keyboardType: TextInputType.visiblePassword,
                                        validator: Validation.passwordValidation,
                                        hintText: 'Password',
                                        suffixIcon: InkWell(
                                          onTap: () => context.read<LoginBloc>().add(TogglePasswordObscurity()),
                                          child: state.isPasswordObscured
                                              ? const Icon(
                                                  CupertinoIcons.eye,
                                                  size: 12,
                                                  color: CColors.gray,
                                                )
                                              : const Icon(
                                                  CupertinoIcons.eye_slash,
                                                  size: 12,
                                                  color: CColors.gray,
                                                ),
                                        ),
                                      );
                                    },
                                  ),
                                  CButton(
                                    margin: const EdgeInsets.symmetric(vertical: AppHelper.pad_20),
                                    onTap: () => context.read<LoginBloc>().add(SignIn()),
                                    label: const Text('Sign in').w900(fontSize: 14, color: CColors.white),
                                  ),
                                  Center(child: const Text('or choose').w500(fontSize: 11, color: CColors.white)),
                                  CButton(
                                    margin: const EdgeInsets.symmetric(vertical: AppHelper.pad_20),
                                    backgroundColor: CColors.white,
                                    onTap: () => context.read<LoginBloc>().add(FingerPrintLogin()),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: AppHelper.pad_6),
                                          child: SvgPicture.asset(
                                            'assets/icons/finger_print.svg',
                                            height: 18,
                                            width: 17,
                                          ),
                                        ),
                                        const Text('Sign in with Passkey').w700(fontSize: 13, color: CColors.secondary),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CButton(
                                          backgroundColor: CColors.white,
                                          margin: const EdgeInsets.only(right: AppHelper.pad_7),
                                          onTap: () => context.read<LoginBloc>().add(GoogleLogin()),
                                          child: SvgPicture.asset(
                                            'assets/icons/google.svg',
                                            height: 18,
                                            width: 17,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: CButton(
                                          backgroundColor: CColors.white,
                                          margin: const EdgeInsets.only(left: AppHelper.pad_7),
                                          onTap: () => context.read<LoginBloc>().add(GithubLogin(context: context)),
                                          child: SvgPicture.asset(
                                            'assets/icons/github.svg',
                                            height: 18,
                                            width: 17,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: AppHelper.pad_16),
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            WidgetSpan(child: const Text('Don’t have an account yet? ').w500(fontSize: 8, color: CColors.white)),
                                            WidgetSpan(child: GestureDetector(onTap: () => context.read<LoginBloc>().add(RegisterAccount()), child: const Text('Register for free').w500(fontSize: 8, color: CColors.ternary))),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
