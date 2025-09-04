import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps_digital_task/core/utils/app_colors.dart';
import 'package:ps_digital_task/core/utils/app_sizes.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.s5.h),
      child: const Divider(color: AppColors.gray3),
    );
  }
}
