import 'package:cruz_roja/global/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget preffix;
  final bool isDense;
  final bool isObscure;
  final VoidCallback onTap;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final Function(String) validator;

  const CustomTextField({
    Key key,
    this.controller,
    this.hintText,
    this.preffix,
    this.isDense,
    this.isObscure,
    this.focusNode,
    this.keyboardType,
    this.onTap,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return TextFormField(
      validator: validator,
      controller: controller,
      onTap: onTap,
      focusNode: focusNode,
      obscureText: isObscure ?? false,
      style: TextStyle(fontSize: deviceHeight > 650 ? 13.0.sp : 10.0.sp),
      keyboardType: keyboardType ?? TextInputType.name,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(
                color: AppColors.lightGrey, style: BorderStyle.solid)),
        // enabledBorder:
        //     UnderlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
        // focusedBorder:
        //     UnderlineInputBorder(borderRadius: BorderRadius.circular(4.0)),
        isDense: isDense ?? true,
        contentPadding:
            EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 0.1.h),
        prefixIconConstraints: BoxConstraints(maxHeight: 6.0.h, minWidth: 0),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.5.h, vertical: 0.2.h),
          child: preffix,
        ),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: 10.0.sp,
              color: AppColors.lightGrey,
            ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
