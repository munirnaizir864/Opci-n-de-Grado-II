import 'package:cruz_roja/global/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final VoidCallback onTap;
  CustomCheckBox({Key key, this.value, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.red, width: 3),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: value
            ? Icon(
                Icons.check,
                size: 18.0,
                color: AppColors.red,
              )
            : Icon(
                null,
                size: 18.0,
              ),
      ),
    );
  }
}
