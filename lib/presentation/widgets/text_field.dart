import '../export.dart';

class CTextFormField extends StatelessWidget {
  const CTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.enabled,
    this.obscureText,
    this.onChanged,
    this.maxLength,
    this.keyboardType,
    this.suffixIcon,
    this.validator,
    this.prefixIcon,
    this.textInputAction,
    this.fillColor,
    this.isDense = true,
    this.autovalidateMode,
  });

  final String hintText;
  final TextEditingController controller;
  final bool? obscureText;
  final bool? enabled;
  final ValueChanged? onChanged;
  final int? maxLength;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final bool isDense;
  final AutovalidateMode? autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      validator: validator,
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      enabled: enabled ?? true,
      onChanged: onChanged,
      maxLength: maxLength,
      style: CTextStyle.fontStyle(color: CColors.secondary, fontSize: 10, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        isDense: isDense,
        counterText: '',
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints.tight(const Size(20, 12)),
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: CTextStyle.fontStyle(color: CColors.gray, fontSize: 10, fontWeight: FontWeight.w400),
        border: _border,
        enabledBorder: _border,
        focusedBorder: _border,
        errorBorder: _errorBorder,
        contentPadding: const EdgeInsets.only(bottom: AppHelper.bRad_6, top: AppHelper.pad_6, left: AppHelper.pad_12, right: AppHelper.pad_12),
        filled: true,
        fillColor: fillColor ?? CColors.white,
        focusedErrorBorder: _border,
        disabledBorder: _disabledBorder,
      ),
    );
  }

  get _border => OutlineInputBorder(borderRadius: BorderRadius.circular(AppHelper.bRad_4), borderSide: BorderSide.none, gapPadding: 0);
  get _disabledBorder => OutlineInputBorder(borderRadius: BorderRadius.circular(AppHelper.bRad_4), borderSide: BorderSide.none, gapPadding: 0);
  get _errorBorder => OutlineInputBorder(borderRadius: BorderRadius.circular(AppHelper.bRad_4), borderSide: BorderSide.none, gapPadding: 0);
}
