import 'package:cruz_roja/domain/entities/dynamic_entity.dart';
import 'package:cruz_roja/presentation/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LabelAndDropDown extends StatelessWidget {
  final DynamicEntity dynamicEntity;
  final List<DynamicEntity> dynamiList;
  final ValueChanged<DynamicEntity> onChanged;
  final String hintText;
  final String text;
  final Function(DynamicEntity) validator;
  const LabelAndDropDown(
      {Key key,
      this.dynamicEntity,
      this.dynamiList,
      this.onChanged,
      this.hintText,
      this.text,
      this.validator})
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
        DropdownButtonFormField<DynamicEntity>(
          isDense: true,
          decoration: InputDecoration(contentPadding: EdgeInsets.zero),
          value: dynamicEntity != null ? dynamicEntity : null,
          validator: validator ?? null,
          hint: Text(
            hintText,
          ),
          onChanged: onChanged,
          items: dynamiList.map((val) {
            return DropdownMenuItem<DynamicEntity>(
              value: val,
              child: new Text(val.name),
            );
          }).toList(),
        ),
      ],
    );
  }
}
