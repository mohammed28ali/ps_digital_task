import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ps_digital_task/core/utils/app_colors.dart';
import 'package:ps_digital_task/core/utils/app_icons.dart';
import 'package:ps_digital_task/core/utils/app_sizes.dart';
import 'package:ps_digital_task/core/utils/app_strings.dart';
import 'package:ps_digital_task/features/main_screen/cubit/bottom_nav_cubit.dart';
import 'package:ps_digital_task/features/menu_screen/presentation/screen/menu_screen.dart';
import 'package:ps_digital_task/features/profile_screen/presentation/screens/profile_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> _screens = [
    const HomeScreen(),
    const MenuScreen(),
    const PacketScreen(),
    const ProfileScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, currentIndex) {
        final bottomNavCubit = context.read<BottomNavCubit>();

        return Scaffold(
          body: _screens[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,

            onTap: (index) => bottomNavCubit.changeTab(index),
            selectedLabelStyle: TextStyle(color: Colors.black),
            unselectedLabelStyle: TextStyle(color: Colors.black),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,

            items: [
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: AppSizes.s30.w,
                  height: AppSizes.s30.h,
                  child: SvgPicture.asset(
                    AppIcons.homeIcon,
                    colorFilter: ColorFilter.mode(
                      currentIndex == 0
                          ? AppColors.primaryColor
                          : AppColors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),

                label: AppStrings.home,
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: AppSizes.s30.w,
                  height: AppSizes.s30.h,
                  child: SvgPicture.asset(
                    AppIcons.menuIcon,
                    colorFilter: ColorFilter.mode(
                      currentIndex == 1
                          ? AppColors.primaryColor
                          : AppColors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                label: AppStrings.menu,
              ),

              BottomNavigationBarItem(
                icon: Container(
                  width: AppSizes.s75.w,
                  height: AppSizes.s75.h,
                  padding: EdgeInsets.all(AppSizes.s14.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: SvgPicture.asset(AppIcons.packet),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: AppSizes.s30.w,
                  height: AppSizes.s30.h,
                  child: SvgPicture.asset(
                    AppIcons.profileIcon,
                    colorFilter: ColorFilter.mode(
                      currentIndex == 3
                          ? AppColors.primaryColor
                          : AppColors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                label: AppStrings.profile,
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: AppSizes.s30.w,
                  height: AppSizes.s30.h,
                  child: SvgPicture.asset(
                    AppIcons.moreIcon,
                    colorFilter: ColorFilter.mode(
                      currentIndex == 4
                          ? AppColors.primaryColor
                          : AppColors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                label: AppStrings.more,
              ),
            ],
          ),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Home Screen"));
  }
}

class PacketScreen extends StatelessWidget {
  const PacketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Packet Screen"));
  }
}

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("More Screen"));
  }
}
