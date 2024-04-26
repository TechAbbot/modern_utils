library modern_utils;

import 'package:flutter/material.dart';
import 'package:modern_utils/widgets/evolved_button.dart';

export 'function_kit.dart';
export 'widgets/evolved_button.dart';

class ModernUtils {
  static final ModernUtils instance = ModernUtils._();

  factory ModernUtils() => instance;

  ModernUtils._();

  late EvolvedButtonStyle evolvedButtonStyle;
  late MediaQueryData _data;
  late Color _primaryColor;

  MediaQueryData get data => _data;
  Color get primaryColor => _primaryColor;

  void initialize({
    required BuildContext context,
    EvolvedButtonStyle? evolvedButtonStyle,
    Color? primaryColor,
  }) {
    _data = MediaQuery.maybeOf(context)!;
    _primaryColor = primaryColor ?? Colors.blue[800]!;
    if (evolvedButtonStyle != null) {
      this.evolvedButtonStyle = evolvedButtonStyle;
    } else {
      this.evolvedButtonStyle = EvolvedButtonStyle(
        primaryColor: _primaryColor,
        disableColor: Colors.grey[500]!,
        shadowColor: Colors.grey.withOpacity(.4),
        textColor: Colors.white,
        textSize: 16.0,
        height: 45.0,
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        ),
        radius: 30.0,
      );
    }
  }
}
