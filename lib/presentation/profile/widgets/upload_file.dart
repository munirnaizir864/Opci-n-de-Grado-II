import 'dart:ffi';
import 'dart:io';

import 'package:cruz_roja/global/theme/theme.dart';
import 'package:cruz_roja/presentation/auth/widgets/custom_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class UploadFile extends StatelessWidget {
  final String text;
  final String text2;
  final VoidCallback pickFile;
  final VoidCallback uploadFile;
  File file;
  final String path;
  UploadFile(
      {Key key,
      this.text,
      this.pickFile,
      this.file,
      this.path,
      this.uploadFile,
      this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style:
              Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 15.0.sp),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: InkWell(
                onTap: pickFile,
                child: Container(
                  height: 40.0,
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                  ),
                  child: Text(
                    path != null ? path : text2,
                    style: TextStyle(color: Colors.grey, fontSize: 10.0.sp),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: CustomButton(
                height: 40,
                text: Text(
                  'Upload',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: AppColors.white,
                        fontSize: 10.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                backgroundColor: AppColors.red,
                onPressed: uploadFile,
              ),
            )
          ],
        ),
      ],
    );
  }
}
