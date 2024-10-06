import 'dart:ui';

import '../theme/app_color.dart';

enum ToastType {
  success(0),
  error(1);

  const ToastType(this.value);

  final int value;

  static ToastType fromValue(int? value) {
    switch (value) {
      case 0:
        return success;
      case 1:
        return error;
      default:
        return error;
    }
  }

  Color get toColor {
    if (this == success) {
      return Palette.primary;
    }
    return Palette.red;
  }
}
