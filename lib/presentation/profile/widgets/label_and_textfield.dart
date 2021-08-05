import 'package:cruz_roja/presentation/auth/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LabelAndTextfield extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onTap;
  final Function(String) validator;
  final TextInputType textInputType;

  const LabelAndTextfield(
      {Key key,
      this.text,
      this.controller,
      this.focusNode,
      this.onTap,
      this.validator,
      this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style:
              Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 2.0.h),
        ),
        CustomTextField(
          focusNode: focusNode,
          validator: validator,
          isDense: true,
          controller: controller,
          keyboardType: textInputType,
          onTap: onTap,
        )
      ],
    );
  }
}
