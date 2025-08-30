import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps_digital_task/core/helpers/text_styles.dart';
import 'package:ps_digital_task/core/shared_widgets/custom_text.dart';
import 'package:ps_digital_task/core/utils/app_sizes.dart';
import 'package:ps_digital_task/core/utils/app_strings.dart';
import 'package:ps_digital_task/features/menu_screen/presentation/widget/category_menu_list.dart';
import 'package:ps_digital_task/features/menu_screen/presentation/widget/menu_header.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.defaultScaffoldHorizontalPaddingValue.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MenuScreenHeader(),
            const CategoryMenuList(),
            CustomText(
              text: AppStrings.sandwiches,
              textStyle: TextStyles.font20BlackBold,
            ),
            Container(
              height: AppSizes.s200.h,
              color: Colors.red,
              child: Row(
                children: [
                  Container(width: AppSizes.s120.w, color: Colors.green),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Crunchy Jalapeno Sandwich",
                        textStyle: TextStyles.font20BlackBold,
                      ),
                      CustomText(
                        text: "Sandwich prepared with 10 crunch and Kris",
                        textStyle: TextStyles.font20BlackBold,
                      ),
                      CustomText(
                        text: "Customize",
                        textStyle: TextStyles.font20BlackBold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
