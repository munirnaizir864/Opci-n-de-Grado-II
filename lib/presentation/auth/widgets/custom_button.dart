import 'package:cruz_roja/global/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final Color borderColor;
  final Widget text;
  const CustomButton(
      {Key key,
      this.text,
      this.backgroundColor,
      this.height,
      this.width,
      this.borderColor,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 57,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.purple,
            borderRadius: BorderRadius.circular(5.0),
            border:
                Border.all(color: borderColor ?? AppColors.white, width: 0.7)),
        child: text,
      ),
      onTap: onPressed,
    );
  }
}
