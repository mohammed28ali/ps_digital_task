import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ps_digital_task/core/utils/app_colors.dart';
import 'package:ps_digital_task/core/utils/app_sizes.dart';

class IconButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String iconSvg;
  final Color backgroundColor;
  const IconButtonWidget({
    super.key,
    required this.onTap,
    required this.iconSvg,
    this.backgroundColor = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppSizes.s12.w),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppSizes.s5.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: AppSizes.s5.r,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: SvgPicture.asset(
          iconSvg,
          width: AppSizes.s12.w,
          height: AppSizes.s12.h,
        ),
      ),
    );
  }
}
