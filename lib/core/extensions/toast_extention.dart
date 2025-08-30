import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ps_digital_task/core/utils/app_colors.dart';

extension SnackBarExtension on BuildContext {
  void closeSnackBar() => ScaffoldMessenger.of(this).hideCurrentSnackBar();

  void errorSnackBar(String error, {int duration = 2}) {
    _showToast(error, isError: true, duration: duration);
  }

  void successSnackBar(String msg, {int duration = 2}) {
    _showToast(msg, isError: false, duration: duration);
  }

  void _showToast(String message, {required bool isError, int duration = 2}) {
    Fluttertoast.cancel();

    Fluttertoast.showToast(
      msg: message,
      toastLength: duration > 2 ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: duration,
      backgroundColor: isError ? AppColors.errorColor : AppColors.successColor,
      textColor: Colors.white,
      fontSize: 16.sp,
    );
  }
}
