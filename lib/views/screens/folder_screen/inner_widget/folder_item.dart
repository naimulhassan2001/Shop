import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_string.dart';


class FolderItem extends StatelessWidget {
  FolderItem({
    super.key,
    required this.folderName,
    required this.note,
    required this.image,
  });

  String folderName;

  String note;
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: image.isNotEmpty
                  ? Image.network(image)
                  : Image.asset(AppString.profile)),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    folderName,
                    maxLines: 1,
                    style: TextStyle(
                        color: const Color(0xFF393F42),
                        fontSize: 18.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    note,
                    maxLines: 1,
                    style: TextStyle(
                        color: const Color(0xFF393F42),
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400),
                  ),
                  // const Spacer(),

                ],
              ))
        ],
      ),
    );
  }
}
