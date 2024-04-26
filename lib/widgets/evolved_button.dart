import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modern_utils/modern_utils.dart';

class EvolvedButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final Widget? child;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final Color? shadowColor;
  final TextStyle? textStyle;
  final List<BoxShadow>? boxShadow;
  final EdgeInsets margin;
  final EdgeInsets? padding;
  final bool hasShadow;
  final bool enabled;
  final bool dynamicSize;
  final bool onlyBorder;

  const EvolvedButton({
    required this.title,
    required this.onTap,
    this.child,
    this.height,
    this.width,
    this.padding,
    this.borderRadius,
    this.color,
    this.borderColor,
    this.textColor,
    this.shadowColor,
    this.textStyle,
    this.boxShadow,
    this.margin = EdgeInsets.zero,
    this.hasShadow = true,
    this.enabled = true,
    this.dynamicSize = false,
    this.onlyBorder = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        margin: margin,
        height: height ??
            (dynamicSize
                ? null
                : ModernUtils.instance.evolvedButtonStyle.height),
        width: width ??
            (dynamicSize ? null : ModernUtils.instance.data.size.width),
        padding: padding ?? ModernUtils.instance.evolvedButtonStyle.padding,
        decoration: BoxDecoration(
          border: borderColor == null
              ? null
              : Border.all(
                  color: borderColor!,
                ),
          color: enabled
              ? onlyBorder
                  ? null
                  : (color ??
                      ModernUtils.instance.evolvedButtonStyle.primaryColor)
              : ModernUtils.instance.evolvedButtonStyle.disableColor,
          borderRadius: BorderRadius.all(
            Radius.circular((borderRadius ??
                ModernUtils.instance.evolvedButtonStyle.radius)),
          ),
          boxShadow: hasShadow
              ? boxShadow ??
                  [
                    BoxShadow(
                      blurRadius: 6,
                      spreadRadius: 1,
                      offset: const Offset(0, 3),
                      color: shadowColor ??
                          ModernUtils.instance.evolvedButtonStyle.shadowColor,
                    ),
                  ]
              : null,
        ),
        alignment: dynamicSize ? null : Alignment.center,
        child: child ??
            Text(
              title,
              textAlign: TextAlign.center,
              style: textStyle ??
                  TextStyle(
                    color: textColor ??
                        ModernUtils.instance.evolvedButtonStyle.textColor,
                    fontSize: ModernUtils.instance.evolvedButtonStyle.textSize,
                    fontWeight: FontWeight.w600,
                  ),
            ),
      ),
    );
  }
}

class EvolvedButtonStyle {
  Color primaryColor;
  Color disableColor;
  Color shadowColor;
  Color textColor;
  double textSize;
  double height;
  double radius;
  EdgeInsets padding;

  EvolvedButtonStyle({
    required this.primaryColor,
    required this.disableColor,
    required this.shadowColor,
    required this.textColor,
    required this.textSize,
    required this.height,
    required this.radius,
    required this.padding,
  });
}
