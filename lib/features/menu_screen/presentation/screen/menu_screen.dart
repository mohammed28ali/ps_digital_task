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
      return const Center(child: CircularProgressIndicator());
    } else if (state is MenuError) {
      return Center(child: Text(state.message));
    } else if (state is MenuLoaded) {
      return _buildMenuList(state);
    }
    return const SizedBox.shrink();
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
                text:
                    '(${state.menuList.length.toString()} ${AppStrings.items})',
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
