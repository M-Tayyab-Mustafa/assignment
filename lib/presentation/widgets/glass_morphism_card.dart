import '../export.dart';

class GlassMorphismCard extends StatelessWidget {
  const GlassMorphismCard({
    super.key,
    this.height,
    required this.width,
    this.borderRadius = 20,
    this.borderWidth = 1.79,
    this.sigma = 3,
    required this.child,
  });
  final double? height;
  final double width;
  final double borderRadius;
  final double borderWidth;
  final double sigma;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Stack(
          fit: StackFit.loose,
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: CColors.primaryOP28Per,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppHelper.pad_30, horizontal: AppHelper.pad_30),
                  child: child,
                ),
              ),
            ),
            IgnorePointer(
              child: ShaderMask(
                shaderCallback: (bounds) => CColors.linearGradient.createShader(bounds),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius), border: Border.all(color: CColors.white)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppHelper.pad_30, horizontal: AppHelper.pad_30),
                      child: child,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
