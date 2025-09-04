import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ps_digital_task/core/helpers/spacing.dart';
import 'package:ps_digital_task/core/helpers/text_styles.dart';
import 'package:ps_digital_task/core/shared_widgets/custom_text.dart';
import 'package:ps_digital_task/core/shared_widgets/icon_button.dart';
import 'package:ps_digital_task/core/utils/app_colors.dart';
import 'package:ps_digital_task/core/utils/app_icons.dart';
import 'package:ps_digital_task/core/utils/app_sizes.dart';
import 'package:ps_digital_task/core/utils/app_strings.dart';

class MenuItemCard extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final String image;
  const MenuItemCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSizes.s12.h),
      height: AppSizes.s200.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.defaultBorderRadius.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: AppSizes.s120.w,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(
                AppSizes.defaultBorderRadius.r,
              ),
              image: DecorationImage(
                image: CachedNetworkImageProvider(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: AppSizes.s12.w,
                right: AppSizes.s12.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: CustomText(
                          text: title,
                          textStyle: TextStyles.font20BlackBold,
                          textOverFlow: TextOverflow.ellipsis,
                          lines: 1,
                        ),
                      ),
                      Icon(Icons.favorite_outline, color: AppColors.black),
                    ],
                  ),
                  Flexible(
                    child: CustomText(
                      text: description,
                      textStyle: TextStyles.font12GrayMedium.copyWith(
                        color: AppColors.gray,
                        fontSize: AppSizes.s15.sp,
                      ),
                      lines: 2,
                      align: TextAlign.left,
                      textOverFlow: TextOverflow.ellipsis,
                    ),
                  ),
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: CustomText(
                            text: AppStrings.customize,
                            textStyle: TextStyles.font20BlackBold.copyWith(
                              color: AppColors.darkRed,
                            ),
                            textOverFlow: TextOverflow.ellipsis,
                          ),
                        ),
                        horizontalSpace(AppSizes.s5.w),
                        Container(
                          width: AppSizes.s15.w,
                          height: AppSizes.s15.h,
                          decoration: BoxDecoration(
                            color: AppColors.darkRed,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(AppIcons.expandLessIcon),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: CustomText(
                            text: price.toString(),
                            textStyle: TextStyles.font20BlackBold,
                            textOverFlow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButtonWidget(
                              onTap: () {},
                              iconSvg: AppIcons.trashIcon,
                              backgroundColor: AppColors.gray2,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.s12.w,
                              ),
                              child: CustomText(
                                text: "1",
                                textDecoration: TextDecoration.none,
                                textStyle: TextStyles.font20BlackBold,
                              ),
                            ),
                            IconButtonWidget(
                              onTap: () {},
                              iconSvg: AppIcons.plusIcon,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
