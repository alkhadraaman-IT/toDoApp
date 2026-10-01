import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../theme/app_colors.dart';

/// مساعد عرض رسائل Toast بألوان متناسقة مع تصميم Material 3
class ToastHelper {
  ToastHelper._();

  /// عرض رسالة نجاح — لون أخضر متناسق مع التصميم
  static void showSuccess(String message) {
    _show(
      message,
      backgroundColor: const Color(0xFF2E7D32),
      textColor: Colors.white,
      icon: Icons.check_circle_rounded,
    );
  }

  /// عرض رسالة خطأ — لون أحمر متناسق مع التصميم
  static void showError(String message) {
    _show(
      message,
      backgroundColor: const Color(0xFFC62828),
      textColor: Colors.white,
      icon: Icons.error_rounded,
    );
  }

  /// عرض رسالة معلومات — لون أزرق متناسق مع التصميم
  static void showInfo(String message) {
    _show(
      message,
      backgroundColor: const Color(0xFF1565C0),
      textColor: Colors.white,
      icon: Icons.info_rounded,
    );
  }

  /// عرض رسالة تحذير — لون برتقالي متناسق مع التصميم
  static void showWarning(String message) {
    _show(
      message,
      backgroundColor: const Color(0xFFE65100),
      textColor: Colors.white,
      icon: Icons.warning_rounded,
    );
  }

  static void _show(
    String message, {
    required Color backgroundColor,
    required Color textColor,
    required IconData icon,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 14.0,
      timeInSecForIosWeb: 2,
    );
  }
}
