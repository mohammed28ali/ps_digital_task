import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ps_digital_task/core/helpers/spacing.dart';
import 'package:ps_digital_task/core/helpers/text_styles.dart';
import 'package:ps_digital_task/core/shared_widgets/custom_button.dart';
import 'package:ps_digital_task/core/utils/app_colors.dart';
import 'package:ps_digital_task/core/utils/app_icons.dart';
import 'package:ps_digital_task/core/utils/app_sizes.dart';
import 'package:ps_digital_task/core/utils/app_strings.dart';
import 'package:ps_digital_task/core/shared_widgets/custom_text.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.s20.h,
        horizontal: AppSizes.s20.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: AppSizes.s4.r,
            offset: Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(AppSizes.s16.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(AppSizes.s30.w),
                decoration: BoxDecoration(
                  color: AppColors.gray2,
                  shape: BoxShape.circle,
                ),
                child: CustomText(
                  text: 'A',
                  textStyle: TextStyles.font20BlackBold.copyWith(
                    fontSize: AppSizes.s30.sp,
                  ),
                ),
              ),
              horizontalSpace(AppSizes.s20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Ahmed Magdy',
                        textStyle: TextStyles.font20BlackBold.copyWith(),
                      ),
                      horizontalSpace(AppSizes.s40.w),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.logoutIcon,
                            width: AppSizes.s20.w,
                            height: AppSizes.s20.h,
                          ),
                          horizontalSpace(AppSizes.s3),
                          CustomText(
                            text: AppStrings.logout,
                            textStyle: TextStyles.font20BlackBold.copyWith(
                              color: AppColors.gray,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  verticalSpace(AppSizes.s5),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.egyptFlag,
                        width: AppSizes.s20.w,
                        height: AppSizes.s20.h,
                      ),
                      horizontalSpace(AppSizes.s5),
                      CustomText(
                        text: '012-000-00-663',
                        textStyle: TextStyles.font20BlackBold.copyWith(),
                      ),
                    ],
                  ),
                  verticalSpace(AppSizes.s5),
                  CustomText(
                    text: 'ahmed@paradigmegypt.com',
                    textStyle: TextStyles.font20BlackBold.copyWith(
                      color: AppColors.gray2,
                    ),
                  ),
                ],
              ),
            ],
          ),

          verticalSpace(AppSizes.s5),
          CustomButton(
            textColor: Colors.black,
            text: AppStrings.updateProfile,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
