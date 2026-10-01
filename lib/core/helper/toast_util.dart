import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static void showError(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: const Color(0xFFE53935), // 👈 ضع لون الخطأ المناسب لتطبيقك (مثلاً أحمر داكن)
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }

  static void showSuccess(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: const Color(0xFF2E7D32), // 👈 لون النجاح المتناسق مع تطبيقك
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }
}