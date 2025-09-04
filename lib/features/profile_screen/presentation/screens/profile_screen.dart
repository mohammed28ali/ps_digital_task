import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ps_digital_task/core/helpers/spacing.dart';
import 'package:ps_digital_task/core/shared_widgets/custom_text.dart';
import 'package:ps_digital_task/core/utils/app_colors.dart';
import 'package:ps_digital_task/core/utils/app_icons.dart';
import 'package:ps_digital_task/core/utils/app_sizes.dart';
import 'package:ps_digital_task/features/profile_screen/presentation/widgets/nav_widget.dart';
import 'package:ps_digital_task/features/profile_screen/presentation/widgets/profile_card.dart';
import 'package:ps_digital_task/features/profile_screen/presentation/widgets/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.defaultScaffoldHorizontalPaddingValue.w,
        ),
        child: Column(
          children: [
            ProfileHeader(),
            ProfileCard(),

            verticalSpace(AppSizes.s5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavigationWidget(icon: AppIcons.favIcon, title: 'Home'),
                NavigationWidget(icon: AppIcons.rewardsIcon, title: 'Home'),
                NavigationWidget(icon: AppIcons.packet, title: 'Home'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
