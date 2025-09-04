import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ps_digital_task/core/helpers/spacing.dart';
import 'package:ps_digital_task/core/helpers/text_styles.dart';
import 'package:ps_digital_task/core/shared_widgets/custom_text.dart';
import 'package:ps_digital_task/core/utils/app_colors.dart';
import 'package:ps_digital_task/core/utils/app_sizes.dart';

class ProfileItem extends StatelessWidget {
  final String icon;
  final String title;
  final bool hideForwardIcon;
  final Color svgColor;
  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    this.hideForwardIcon = false,
    this.svgColor = AppColors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(svgColor, BlendMode.srcIn),
            ),
            horizontalSpace(AppSizes.s5),
            CustomText(
              text: title,
              textStyle: TextStyles.font20BlackBold.copyWith(),
            ),
          ],
        ),
        if (!hideForwardIcon)
          Icon(Icons.arrow_forward_ios, color: AppColors.black),
      ],
    );
  }
}
