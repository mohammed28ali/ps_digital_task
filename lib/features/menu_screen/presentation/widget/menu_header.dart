import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ps_digital_task/core/helpers/text_styles.dart';
import 'package:ps_digital_task/core/shared_widgets/custom_text.dart';
import 'package:ps_digital_task/core/utils/app_constants.dart';
import 'package:ps_digital_task/core/utils/app_icons.dart';
import 'package:ps_digital_task/core/utils/app_strings.dart';

class MenuScreenHeader extends StatelessWidget {
  const MenuScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: AppStrings.exploreMenu,
          textStyle: TextStyles.font20BlackBold.copyWith(
            fontFamily: AppConstants.bikerDiamond,
          ),
        ),
        SvgPicture.asset(AppIcons.searchIcon),
      ],
    );
  }
}
