import '../../export.dart';

class PassKeyPage extends StatelessWidget {
  const PassKeyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PassKeyBloc, PassKeyState>(
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
                                Padding(
                                  padding: const EdgeInsets.only(top: AppHelper.pad_32),
                                  child: const Text('Passkey Sign in').w900(color: CColors.white, fontSize: 16),
                                ),
                                const Text('Place your finger on the sensor to continue').w400(color: CColors.white, fontSize: 11),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: AppHelper.pad_38),
                                    child: Image.asset(
                                      'assets/images/finger_print_scanner.png',
                                      height: 176,
                                      width: 176,
                                    ),
                                  ),
                                ),
                                CButton(
                                  onTap: () => context.read<PassKeyBloc>().add(CancelScanning()),
                                  label: const Text('Cancel').w900(fontSize: 14, color: CColors.white),
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
