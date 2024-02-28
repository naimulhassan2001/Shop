import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/hive_controller.dart';
import 'package:shop/models/boxes.dart';
import 'package:shop/models/hive_model.dart';
import 'package:shop/utils/app_url/app_urls.dart';

import '../../../widgets/custom_text.dart';

class WishLisListItem extends StatelessWidget {
  WishLisListItem({super.key, required this.notesModel});

  NotesModel notesModel;

  HiveController hiveController = Get.put(HiveController()) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Image.network("${AppUrls.imageUrl}${notesModel.image}")),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
              flex: 7,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      notesModel.title,
                      maxLines: 1,
                      style: TextStyle(
                          color: const Color(0xFF393F42),
                          fontSize: 18.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomText(title: "\$ ${notesModel.price}")
                ],
              )),
          
          IconButton(onPressed: () {

            print("before=========================${hiveController.isCartAdded}") ;
            notesModel.delete() ;
            hiveController.cartList() ;
            hiveController.saveCart() ;




          }, icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}
