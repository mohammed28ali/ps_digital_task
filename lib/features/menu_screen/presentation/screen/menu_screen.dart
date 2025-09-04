import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps_digital_task/core/helpers/font_weight_helper.dart';
import 'package:ps_digital_task/core/helpers/spacing.dart';
import 'package:ps_digital_task/core/helpers/text_styles.dart';
import 'package:ps_digital_task/core/shared_widgets/custom_text.dart';

import 'package:ps_digital_task/core/utils/app_sizes.dart';
import 'package:ps_digital_task/core/utils/app_strings.dart';
import 'package:ps_digital_task/features/menu_screen/presentation/cubit/menu_cubit.dart';
import 'package:ps_digital_task/features/menu_screen/presentation/widget/category_menu_list.dart';
import 'package:ps_digital_task/features/menu_screen/presentation/widget/menu_header.dart';
import 'package:ps_digital_task/config/dependency_injection/injection_container.dart'
    as di;
import 'package:ps_digital_task/features/menu_screen/presentation/widget/menu_item_card.dart';

import 'package:shimmer/shimmer.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<MenuCubit>()..fetchMenuList(),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.defaultScaffoldHorizontalPaddingValue.w,
          ),
          child: BlocConsumer<MenuCubit, MenuState>(
            listener: (context, state) {
              log('state: ${state.toString()}');
            },
            builder: (context, state) {
              return _buildContent(context, state);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, MenuState state) {
    if (state is MenuLoading) {
      return _buildShimmerList();
    } else if (state is MenuError) {
      return Center(child: Text(state.message));
    } else if (state is MenuLoaded) {
      return _buildMenuList(state);
    }
    return const SizedBox.shrink();
  }

  Widget _buildShimmerList() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 25.h,
                width: 120.w,
                color: Colors.grey[300],
                margin: EdgeInsets.symmetric(vertical: 8.h),
              ),
              Container(
                height: 20.h,
                width: 80.w,
                color: Colors.grey[300],
                margin: EdgeInsets.only(bottom: 12.h),
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: AppSizes.s200.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 120.w,
                        height: double.infinity,
                        color: Colors.grey[300],
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 18.h,
                              width: 150.w,
                              color: Colors.grey[300],
                              margin: EdgeInsets.only(top: 8.h, bottom: 8.h),
                            ),
                            Container(
                              height: 14.h,
                              width: 200.w,
                              color: Colors.grey[300],
                              margin: EdgeInsets.only(bottom: 8.h),
                            ),
                            Container(
                              height: 14.h,
                              width: 100.w,
                              color: Colors.grey[300],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            childCount: 6, // Number of shimmer placeholders
          ),
        ),
      ],
    );
  }

  Widget _buildMenuList(MenuLoaded state) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: MenuScreenHeader()),
        const SliverToBoxAdapter(child: CategoryMenuList()),
        SliverToBoxAdapter(
          child: Row(
            children: [
              CustomText(
                text: AppStrings.sandwiches,
                textStyle: TextStyles.font20BlackBold,
              ),
              horizontalSpace(AppSizes.s5.w),
              CustomText(
                text: '(${state.menuList.length} ${AppStrings.items})',
                textStyle: TextStyles.font20BlackBold.copyWith(
                  fontSize: AppSizes.s15.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final item = state.menuList[index];
            return MenuItemCard(
              title: item.itemName,
              description: item.itemDescription,
              price: item.itemPrice,
              image: item.imageUrl,
            );
          }, childCount: state.menuList.length),
        ),
      ],
    );
  }
}
