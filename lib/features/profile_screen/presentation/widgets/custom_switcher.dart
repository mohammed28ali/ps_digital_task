import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ps_digital_task/core/utils/app_colors.dart';

class CustomSwitcher extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final Color thumbColor;
  final Color activeThumbColor;
  final double width;
  final double height;
  final Duration animationDuration;
  final Widget? activeIcon;
  final Widget? inactiveIcon;

  const CustomSwitcher({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor = const Color(0xFF3C3C3C),
    this.inactiveColor = const Color(0xFF3C3C3C),
    this.thumbColor = AppColors.primaryColor,
    this.activeThumbColor = const Color(0xFFD9D9D9),
    this.width = 60.0,
    this.height = 40.0,
    this.animationDuration = const Duration(milliseconds: 200),
    this.activeIcon,
    this.inactiveIcon,
  }) : super(key: key);

  @override
  State<CustomSwitcher> createState() => _CustomSwitcherState();
}

class _CustomSwitcherState extends State<CustomSwitcher>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _colorAnimation = ColorTween(
      begin: widget.inactiveColor,
      end: widget.activeColor,
    ).animate(_animationController);

    if (widget.value) {
      _animationController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(CustomSwitcher oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      if (widget.value) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: _colorAnimation.value,
              borderRadius: BorderRadius.circular(widget.height / 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: widget.animationDuration,
                  curve: Curves.easeInOut,
                  left: widget.value ? widget.width - widget.height + 2 : 2,
                  top: 2,
                  child: Container(
                    width: widget.height - 4.w,
                    height: widget.height - 4.h,
                    decoration: BoxDecoration(
                      color: widget.value
                          ? widget.activeThumbColor
                          : widget.thumbColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(0, 1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: widget.value
                        ? (widget.activeIcon ??
                              Icon(
                                Icons.check,
                                color: Color(0xFF3C3C3C),
                                size: 16.w,
                              ))
                        : (widget.inactiveIcon ??
                              Icon(
                                Icons.check,
                                color: Color(0xFFD9D9D9),
                                size: 16.w,
                              )),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
