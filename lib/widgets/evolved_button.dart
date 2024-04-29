import 'package:flutter/material.dart';
import 'package:modern_utils/modern_utils.dart';

class EvolvedButton extends StatelessWidget {
  final String title;
  final void Function() onTap;

  /// By using `child` it will override [title]
  final Widget? child;

  /// default `height` is `45.0`. Style is already using `.h` so no need to give responsive.
  final double? height;

  /// default `width` is `MediaQuery.size.width`. Style is already using `.w` so no need to give responsive.
  final double? width;

  /// default `borderRadius` is `30.0`. Style is already using `.r` so no need to give responsive.
  final double? borderRadius;

  /// default `color` is `primaryColor`
  final Color? color;
  final Color? borderColor;

  /// default `textColor` is `Colors.white`
  final Color? textColor;

  /// default `textColor` is `Colors.grey.withOpacity(.4)`
  final Color? shadowColor;

  /// default `disableColor` is `Colors.grey[500]`
  final Color? disableColor;
  final TextStyle? textStyle;
  final List<BoxShadow>? boxShadow;

  /// default `margin` is `EdgeInsets.zero`
  final EdgeInsets margin;
  final EdgeInsets? padding;

  /// if it's true then button will show shadow. default is `true`
  final bool hasShadow;

  /// if it's true then button will look like disabled and onTap will be also override. This is override every condition over [BoxDecoration.color]
  final bool enabled;

  /// if it's true then button's height and width will be disable
  final bool dynamicSize;

  /// if it's true then [BoxDecoration.color] will override and consider as null
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
    this.disableColor,
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
        height: dynamicSize
            ? null
            : (height ?? ModernUtils.instance.evolvedButtonStyle.height ?? 45)
                .hSelf,
        width: width?.wSelf ??
            (dynamicSize ? null : ModernUtils.instance.screenSize.width),
        padding: padding ??
            ModernUtils.instance.evolvedButtonStyle.padding ??
            EdgeInsets.symmetric(
              horizontal: 10.0.wSelf,
              vertical: 4.0.hSelf,
            ),
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
                      ModernUtils.instance.evolvedButtonStyle.primaryColor ??
                      ModernUtils.instance.primaryColor)
              : (disableColor ??
                  ModernUtils.instance.evolvedButtonStyle.disableColor),
          borderRadius: BorderRadius.all(
            Radius.circular((borderRadius ??
                    ModernUtils.instance.evolvedButtonStyle.radius ??
                    30.0)
                .rSelf),
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
                    fontSize:
                        (ModernUtils.instance.evolvedButtonStyle.fontSize ??
                                16.0)
                            .spSelf,
                    fontWeight: FontWeight.w600,
                  ),
            ),
      ),
    );
  }
}

class EvolvedButtonStyle {
  /// default `primaryColor` from `ModernUtils.initialize()`
  Color? primaryColor;

  /// default `Colors.grey[500]`
  Color disableColor;

  /// default `Colors.grey.withOpacity(.4)`
  Color shadowColor;

  /// default `Colors.white`
  Color textColor;

  /// default `16.0`. Style is already using `.sp` so no need to give responsive.
  double? fontSize;

  /// default `45.0`. Style is already using `.h` so no need to give responsive.
  double? height;

  /// default `30.0`. Style is already using `.r` so no need to give responsive.
  double? radius;

  /// default EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 4.0.h)
  EdgeInsets? padding;

  EvolvedButtonStyle({
    this.primaryColor,
    this.disableColor = const Color(0xFF9E9E9E),
    this.shadowColor = const Color.fromARGB(80, 158, 158, 158),
    this.textColor = Colors.white,
    this.fontSize,
    this.height,
    this.radius,
    this.padding,
  });
}
