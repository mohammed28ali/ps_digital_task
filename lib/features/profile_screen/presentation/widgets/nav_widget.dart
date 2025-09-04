import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ps_digital_task/core/helpers/spacing.dart';
import 'package:ps_digital_task/core/helpers/text_styles.dart';
import 'package:ps_digital_task/core/shared_widgets/custom_text.dart';
import 'package:ps_digital_task/core/utils/app_colors.dart';
import 'package:ps_digital_task/core/utils/app_sizes.dart';

class NavigationWidget extends StatelessWidget {
  final String icon;
  final String title;
  const NavigationWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.s25.h,
            horizontal: AppSizes.s25.w,
          ),
          decoration: BoxDecoration(
            color: AppColors.lightPrimary,
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(
                  icon,
                  height: AppSizes.s50.h,
                  width: AppSizes.s50.w,
                ),
              ),
            ],
          ),
        ),
        verticalSpace(AppSizes.s5),
        CustomText(
          text: title,
          textStyle: TextStyles.font20BlackBold.copyWith(),
        ),
      ],
    );
  }
}
