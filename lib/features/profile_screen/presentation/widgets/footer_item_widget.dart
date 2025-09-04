import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ps_digital_task/core/helpers/spacing.dart';
import 'package:ps_digital_task/core/helpers/text_styles.dart';
import 'package:ps_digital_task/core/shared_widgets/custom_text.dart';
import 'package:ps_digital_task/core/utils/app_colors.dart';
import 'package:ps_digital_task/core/utils/app_sizes.dart';
import 'package:ps_digital_task/features/profile_screen/presentation/widgets/custom_switcher.dart';

class FooterItemWidget extends StatelessWidget {
  final String title;
  final String description;
  final bool toggle;
  final String icon;
  const FooterItemWidget({
    super.key,
    required this.title,
    required this.toggle,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(icon, height: AppSizes.s30.h, width: AppSizes.s30.w),
        horizontalSpace(AppSizes.s10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              CustomText(
                text: title,
                textStyle: TextStyles.font20BlackBold.copyWith(),
              ),
              CustomText(
                lines: 2,
                align: TextAlign.left,
                textOverFlow: TextOverflow.ellipsis,
                text: description,
                textStyle: TextStyles.font20BlackBold.copyWith(
                  fontSize: AppSizes.s15,
                  color: AppColors.gray2,
                ),
              ),
            ],
          ),
        ),

        CustomSwitcher(value: toggle, onChanged: (value) {}),
      ],
    );
  }
}
