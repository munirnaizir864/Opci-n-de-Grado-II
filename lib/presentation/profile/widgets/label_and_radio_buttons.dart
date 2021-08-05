import 'package:cruz_roja/global/theme/theme.dart';
import 'package:cruz_roja/presentation/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LabelAndRadioButtons extends StatelessWidget {
  final String label;
  final String radio1;
  final String radio2;
  final int groupValue;
  final ValueChanged<int> onChanged1;
  final ValueChanged<int> onChanged2;

  final controller = Get.find<ProfileController>();
  LabelAndRadioButtons(
      {Key key,
      this.label,
      this.radio1,
      this.radio2,
      this.groupValue,
      this.onChanged1,
      this.onChanged2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style:
              Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 2.0.h),
        ),
        label.isNotEmpty
            ? Spacer()
            : SizedBox(
                width: 12.0,
              ),
        Row(
          children: [
            Radio(
              value: 0,
              groupValue: groupValue,
              onChanged: onChanged1,
              activeColor: AppColors.red,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            Text(
              radio1,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontSize: 2.0.h),
            ),
            Radio(
              value: 1,
              groupValue: groupValue,
              onChanged: onChanged2,
              activeColor: AppColors.red,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            Text(
              radio2,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontSize: 2.0.h),
            )
          ],
        ),
      ],
    );
  }
}
