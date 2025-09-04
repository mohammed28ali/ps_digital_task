import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps_digital_task/core/utils/app_sizes.dart';
import 'package:ps_digital_task/features/menu_screen/presentation/widget/category_menu_button.dart';

class CategoryMenuList extends StatefulWidget {
  const CategoryMenuList({super.key});

  @override
  State<CategoryMenuList> createState() => _CategoryMenuListState();
}

class _CategoryMenuListState extends State<CategoryMenuList> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> menuItems = [
    {"title": "Sandwiches", "icon": Icons.lunch_dining},
    {"title": "Limited Time Offers", "icon": Icons.local_fire_department},
    {"title": "Burgers", "icon": Icons.fastfood},
    {"title": "Pizza", "icon": Icons.local_pizza},
    {"title": "Drinks", "icon": Icons.local_drink},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.s50.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,

        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? AppSizes.s0.w : AppSizes.s12.w,
            ),
            child: CategoryMenuButton(
              title: item["title"],
              icon: item["icon"],
              isSelected: selectedIndex == index,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
