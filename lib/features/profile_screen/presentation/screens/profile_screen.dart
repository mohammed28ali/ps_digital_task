import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ps_digital_task/core/helpers/spacing.dart';
import 'package:ps_digital_task/core/helpers/text_styles.dart';
import 'package:ps_digital_task/core/shared_widgets/custom_text.dart';
import 'package:ps_digital_task/core/utils/app_colors.dart';
import 'package:ps_digital_task/core/utils/app_icons.dart';
import 'package:ps_digital_task/core/utils/app_sizes.dart';
import 'package:ps_digital_task/core/utils/app_strings.dart';
import 'package:ps_digital_task/features/profile_screen/presentation/widgets/custom_divider.dart';
import 'package:ps_digital_task/features/profile_screen/presentation/widgets/custom_switcher.dart';
import 'package:ps_digital_task/features/profile_screen/presentation/widgets/nav_widget.dart';
import 'package:ps_digital_task/features/profile_screen/presentation/widgets/profile_card.dart';
import 'package:ps_digital_task/features/profile_screen/presentation/widgets/profile_header.dart';
import 'package:ps_digital_task/features/profile_screen/presentation/widgets/profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.defaultScaffoldHorizontalPaddingValue.w,
        ),
        child: SingleChildScrollView(
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
              verticalSpace(AppSizes.s5),
              ProfileItem(
                icon: AppIcons.locationIcon,
                title: AppStrings.myAddresses,
              ),
              CustomDivider(),
              ProfileItem(
                icon: AppIcons.keyIcon,
                title: AppStrings.changePassword,
              ),
              CustomDivider(),
              ProfileItem(icon: AppIcons.offersIcon, title: AppStrings.offers),
              CustomDivider(),
              ProfileItem(icon: AppIcons.dealsIcon, title: AppStrings.deals),
              CustomDivider(),
              ProfileItem(
                icon: AppIcons.notificationIcon,
                title: AppStrings.notification,
              ),
              CustomDivider(),
              ProfileItem(
                icon: AppIcons.deleteUserIcon,
                title: AppStrings.deleteMyAccount,
                svgColor: AppColors.darkRed,
                hideForwardIcon: true,
              ),
              verticalSpace(AppSizes.s30),

              FooterItemWidget(
                icon: AppIcons.marktingIcon,
                title: AppStrings.marketingCommunication,
                toggle: true,
                description: AppStrings
                    .onceYouOpenItYouWillReceiveEmailsAndOfferOnYourInbox,
              ),
              verticalSpace(AppSizes.s15),
              FooterItemWidget(
                icon: AppIcons.teleIcon,
                title: AppStrings.appCommunication,
                toggle: false,
                description: AppStrings
                    .onceYouOpenItYouWillReceiveNotificationsFromOurApp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
