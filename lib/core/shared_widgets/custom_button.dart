import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps_digital_task/core/shared_widgets/custom_text.dart';
import 'package:ps_digital_task/core/utils/app_colors.dart';
import 'package:ps_digital_task/core/utils/app_sizes.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final double width;
  final double height;
  final double fontSize;
  final bool isGradient;
  final bool isOutlined;
  final bool isLoading;
  final Color backgroundColor;
  final Color textColor;
  final bool disableShadow;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.width = double.infinity,
    this.height = AppSizes.s55,
    this.fontSize = AppSizes.s16,
    this.isGradient = true,
    this.isOutlined = false,
    this.isLoading = false,
    this.backgroundColor = AppColors.primaryColor,
    this.textColor = Colors.white,
    this.disableShadow = false,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isLoading ? null : widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.width.w,
        height: widget.height.h,
        decoration: BoxDecoration(
          gradient: widget.isOutlined
              ? null
              : widget.isGradient
              ? const LinearGradient(
                  colors: [AppColors.primaryColor, AppColors.darkPrimary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: widget.isGradient ? null : widget.backgroundColor,
          borderRadius: BorderRadius.circular(AppSizes.defaultBorderRadius.r),
          border: widget.isOutlined
              ? Border.all(
                  color: AppColors.primaryColor.withValues(alpha: 0.4),
                  width: 1.5,
                )
              : null,
          boxShadow: widget.isOutlined || widget.disableShadow
              ? null
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    offset: const Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: widget.isLoading
                ? SizedBox(
                    key: const ValueKey('loader'),
                    width: AppSizes.s24.w,
                    height: AppSizes.s24.h,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        widget.isOutlined
                            ? AppColors.primaryColor.withValues(alpha: 0.4)
                            : widget.textColor,
                      ),
                      strokeWidth: 2.5,
                    ),
                  )
                : Row(
                    key: const ValueKey('content'),
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.icon != null) ...[
                        Icon(widget.icon, color: widget.textColor),
                        SizedBox(width: AppSizes.s8.w),
                      ],
                      CustomText(
                        text: widget.text,
                        textStyle: TextStyle(
                          color: widget.isOutlined
                              ? AppColors.primaryColor
                              : widget.textColor,
                          fontSize: widget.fontSize.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
