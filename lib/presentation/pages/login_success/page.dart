import '../../export.dart';

class LoginSuccessPage extends StatelessWidget {
  const LoginSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginSuccessBloc, LoginSuccessState>(
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
                      Center(
                        child: GlassMorphismCard(
                          width: AppHelper.screenSize.width * 0.82,
                          child: LayoutBuilder(builder: (context, cardConstraints) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Center(child: const Text('Sprial').w900(color: CColors.white, fontSize: 26)),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: AppHelper.pad_36, bottom: AppHelper.pad_26),
                                    child: Container(
                                      height: 110,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(blurRadius: 25, color: CColors.ternary.withOpacity(0.5)),
                                        ],
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/icons/success.svg',
                                          height: 110,
                                          width: 110,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(child: const Text('Authentication Successful').w700(color: CColors.white, fontSize: 22)),
                                Padding(
                                  padding: const EdgeInsets.only(top: AppHelper.pad_50),
                                  child: Center(child: const Text('Redirecting you to your account').w400(color: CColors.white, fontSize: 16)),
                                ),
                              ],
                            );
                          }),
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
