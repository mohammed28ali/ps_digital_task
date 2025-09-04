import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps_digital_task/core/extensions/navigator_extension.dart';
import 'package:ps_digital_task/core/helpers/spacing.dart';
import 'package:ps_digital_task/core/helpers/text_styles.dart';
import 'package:ps_digital_task/core/shared_widgets/custom_text.dart';
import 'package:ps_digital_task/core/utils/app_colors.dart';
import 'package:ps_digital_task/core/utils/app_constants.dart';
import 'package:ps_digital_task/core/utils/app_sizes.dart';
import 'package:ps_digital_task/core/utils/app_strings.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Container(
            padding: EdgeInsets.all(AppSizes.s16.w),
            decoration: BoxDecoration(
              color: AppColors.gray3,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        horizontalSpace(AppSizes.s5),
        CustomText(
          text: AppStrings.profile,
          textStyle: TextStyles.font20BlackBold.copyWith(
            fontFamily: AppConstants.bikerDiamond,
          ),
        ),
      ],
    );
  }
}
