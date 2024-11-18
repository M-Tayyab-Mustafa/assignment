// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../export.dart';

class CButton extends StatelessWidget {
  const CButton({
    super.key,
    this.label,
    this.child,
    required this.onTap,
    this.borderRadius,
    this.backgroundColor,
    this.useBorder = false,
    this.fontSize,
    this.borderColor,
    this.margin,
    this.padding,
    this.height = 33,
    this.width,
    this.useUnderLineBorder = false,
    this.shape,
  }) : assert((label != null && child == null) || (label == null && child != null));
  final Text? label;
  final Widget? child;
  final GestureTapCallback onTap;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final bool useBorder;
  final double? fontSize;
  final Color? borderColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final bool useUnderLineBorder;
  final BoxShape? shape;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: AppHelper.pad_16),
        decoration: BoxDecoration(
          borderRadius: shape == BoxShape.circle ? null : borderRadius ?? BorderRadius.circular(AppHelper.bRad_6),
          shape: shape ?? BoxShape.rectangle,
          color: backgroundColor ?? CColors.secondary,
          border: useUnderLineBorder
              ? Border(bottom: BorderSide(color: borderColor ?? CColors.secondary, strokeAlign: BorderSide.strokeAlignInside))
              : useBorder
                  ? Border.all(color: borderColor ?? CColors.secondary, strokeAlign: BorderSide.strokeAlignInside)
                  : null,
        ),
        child: Center(child: label ?? child),
      ),
    );
  }
}
