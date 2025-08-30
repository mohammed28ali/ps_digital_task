import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps_digital_task/core/helpers/spacing.dart';
import 'package:ps_digital_task/core/utils/app_colors.dart';
import 'package:ps_digital_task/core/utils/app_sizes.dart';

class CategoryMenuButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryMenuButton({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.s5.w,
          vertical: AppSizes.s5.h,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.s30.r),
          border: Border.all(color: AppColors.primaryColor, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: AppSizes.s30.w,
              height: AppSizes.s30.h,
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: AppSizes.s24.w,
                color: isSelected ? AppColors.primaryColor : Colors.white,
              ),
            ),
            horizontalSpace(AppSizes.s8),
            Text(
              title,
              style: TextStyle(
                fontSize: AppSizes.s16.sp,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : const Color(0xFF333333),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
