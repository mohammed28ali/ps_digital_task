import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? align;
  final double? height;
  final TextDirection? textDirection;
  final int? lines;
  final TextOverflow? textOverFlow;
  final TextDecoration? textDecoration;
  final Color? decorationColor;
  final GestureTapCallback? onTap;
  final TextStyle? textStyle;

  const CustomText({
    super.key,
    this.lines,
    this.textDirection,
    this.height,
    this.align,
    required this.text,
    this.color,
    this.fontSize,
    this.textDecoration,
    this.fontWeight,
    this.textOverFlow,
    this.decorationColor,
    this.onTap,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text!,
        textDirection: textDirection,
        softWrap: true,
        style: textStyle?.copyWith(
          decoration:
              textDecoration ?? textStyle?.decoration ?? TextDecoration.none,
          height: height ?? textStyle?.height,
          decorationColor:
              decorationColor ?? textStyle?.decorationColor ?? Colors.black,
          fontSize: fontSize ?? textStyle?.fontSize,
          fontWeight: fontWeight ?? textStyle?.fontWeight,
          color: color ?? textStyle?.color ?? Colors.black,
          overflow: textOverFlow ?? textStyle?.overflow,
        ),
        maxLines: lines,
        overflow: TextOverflow.ellipsis,
        textAlign: align ?? TextAlign.center,
      ),
    );
  }
}
