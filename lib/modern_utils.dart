library modern_utils;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_utils/widgets/evolved_button.dart';
import 'package:modern_utils/widgets/modern_text_field.dart';

export 'function_kit.dart';
export 'widgets/evolved_button.dart';

class ModernUtils {
  static final ModernUtils instance = ModernUtils._();

  factory ModernUtils() => instance;

  ModernUtils._();

  late EvolvedButtonStyle _evolvedButtonStyle;
  late ModernTextFieldStyle _modernTextFieldStyle;
  late Size _screenSize;
  Color _primaryColor = Colors.blue[800]!;
  ScreenUtil? _screenUtil;

  EvolvedButtonStyle get evolvedButtonStyle => _evolvedButtonStyle;
  ModernTextFieldStyle get modernTextFieldStyle => _modernTextFieldStyle;
  Size get screenSize => _screenSize;
  Color get primaryColor => _primaryColor;
  ScreenUtil? get screenUtil => _screenUtil;

  /// `BuildContext` compulsoty to get MediaQuery data of root widget. This will used to get theme data, size of device, etc.
  ///
  /// `EvolvedButtonStyle` is to give custom button theme. It is optional to use. default theme will be used if `evolvedButtonStyle` is null.
  ///
  /// `ModernTextFieldStyle` is to give custom textfield theme. It is optional to use. default theme will be used if `modernTextFieldStyle` is null.
  ///
  /// `primaryColor` is to give primary color for entire package. Default color `Colors.blue[800]` will be used if `primaryColor` is null.
  ///
  void initialize({
    required Size screenSize,
    EvolvedButtonStyle? evolvedButtonStyle,
    ModernTextFieldStyle? modernTextFieldStyle,
    Color? primaryColor,
    ScreenUtil? screenUtil,
  }) {
    _screenSize = screenSize;
    _screenUtil = screenUtil;
    if (primaryColor != null) _primaryColor = primaryColor;

    if (evolvedButtonStyle != null) {
      _evolvedButtonStyle = evolvedButtonStyle;
    } else {
      _evolvedButtonStyle = EvolvedButtonStyle(primaryColor: _primaryColor);
    }

    if (modernTextFieldStyle != null) {
      _modernTextFieldStyle = modernTextFieldStyle;
    } else {
      _modernTextFieldStyle = ModernTextFieldStyle(
        primaryColor: this.primaryColor,
      );
    }
  }
}

extension SelfSizeExtension on num {
  double get wSelf =>
      ModernUtils.instance.screenUtil?.setWidth(this) ?? toDouble();

  double get hSelf =>
      ModernUtils.instance.screenUtil?.setHeight(this) ?? toDouble();

  double get rSelf =>
      ModernUtils.instance.screenUtil?.radius(this) ?? toDouble();

  double get spSelf =>
      ModernUtils.instance.screenUtil?.setSp(this) ?? toDouble();
}
