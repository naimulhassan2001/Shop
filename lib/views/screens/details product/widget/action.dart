

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/searchControler.dart';
import 'package:shop/utils/app_icons.dart';

import '../../../../controllers/product_details_controller.dart';
import '../../../../utils/app_string.dart';
import '../../../widgets/custom_buton_outline.dart';
import '../../../widgets/custom_button.dart';
import '../../home/function/create_folder_dailog.dart';

class ProductAction extends StatelessWidget {
  ProductAction({super.key});

  FolderCreateDialog folderCreateDialog = FolderCreateDialog();

  ProductDetailsController productDetailsController =
  Get.put(ProductDetailsController());

  SearchScreenController searchScreenController = Get.put(SearchScreenController()) ;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () {},
            icon: CircleAvatar(
                radius: 20.r,
                backgroundColor: Colors.black12,
                child: const Icon(Icons.favorite_border))),
        IconButton(
            onPressed: () {
              // folderCreateDialog.createFolder(
              //     context, name, image, price);
            },
            icon: CircleAvatar(
                radius: 20.r,
                backgroundColor: Colors.black12,
                child: const Icon(Icons.edit_calendar))),
      ],
    )
    ;
  }
}
