import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modern_utils/modern_utils.dart';

class ModernTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final bool autoFocus;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool readOnly;
  final bool enabled;
  final Color? fillColor;
  final int? maxLines;
  final int? minLine;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;
  final void Function(String)? onFieldSubmitted;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;
  final void Function(PointerDownEvent)? onTapOutside;

  const ModernTextField({
    required this.controller,
    this.labelText,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.hintText,
    this.obscureText = false,
    this.autoFocus = false,
    this.enabled = true,
    this.fillColor,
    this.suffixIcon,
    this.prefixIcon,
    this.inputFormatters,
    this.keyboardType,
    this.autofillHints,
    this.autovalidateMode,
    this.textInputAction,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLine,
    this.maxLength,
    this.textCapitalization,
    this.focusNode,
    this.floatingLabelBehavior,
    this.onTapOutside,
    super.key,
  }) : assert(hintText != null || labelText != null,
            'hintText and labelText cannot be null at same time. Either give value to hintText or labelText or both.');

  @override
  Widget build(BuildContext context) {
    double radius =
        (ModernUtils.instance.modernTextFieldStyle.radius ?? 12.0).rSelf;
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      readOnly: readOnly,
      onTapOutside: onTapOutside,
      style: ModernUtils.instance.modernTextFieldStyle.textStyle ??
          TextStyle(
            fontSize: 14.spSelf,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
      validator: validator,
      focusNode: focusNode,
      onTap: onTap,
      autofocus: autoFocus,
      enabled: enabled,
      minLines: minLine,
      maxLines: maxLines,
      maxLength: maxLength,
      autofillHints: autofillHints,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: ModernUtils.instance.modernTextFieldStyle.labelStyle ??
            TextStyle(
              fontSize: 14.spSelf,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
        floatingLabelBehavior: floatingLabelBehavior,
        hintText: hintText,
        hintStyle: ModernUtils.instance.modernTextFieldStyle.hintStyle ??
            TextStyle(
              fontSize: 14.spSelf,
              color: Colors.grey,
            ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: fillColor ??
            (enabled
                ? (ModernUtils.instance.modernTextFieldStyle.fillColor ??
                    Colors.white)
                : ModernUtils.instance.modernTextFieldStyle.disableColor),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ModernUtils.instance.modernTextFieldStyle.primaryColor ??
                ModernUtils.instance.primaryColor,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: (ModernUtils.instance.modernTextFieldStyle.primaryColor ??
                    ModernUtils.instance.primaryColor)
                .withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ModernUtils.instance.modernTextFieldStyle.errorColor,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: (ModernUtils.instance.modernTextFieldStyle.primaryColor ??
                    ModernUtils.instance.primaryColor)
                .withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ModernUtils.instance.modernTextFieldStyle.errorColor,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ModernUtils.instance.modernTextFieldStyle.disableColor,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        alignLabelWithHint: true,
        errorMaxLines: 3,
      ),
      onChanged: onChanged,
    );
  }
}

class ModernTextFieldStyle {
  TextStyle? labelStyle;
  TextStyle? hintStyle;
  TextStyle? textStyle;
  double? radius;
  EdgeInsets? contentPadding;
  Color errorColor;
  Color disableColor;
  Color? primaryColor;
  Color? fillColor;

  ModernTextFieldStyle({
    this.primaryColor,
    this.labelStyle,
    this.hintStyle,
    this.textStyle,
    this.radius,
    this.errorColor = Colors.red,
    this.disableColor = Colors.black45,
    this.fillColor,
    this.contentPadding,
  });
}
