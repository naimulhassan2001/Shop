import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/product_controller.dart';
import 'package:shop/controllers/product_details_controller.dart';
import 'package:shop/utils/app_url/app_urls.dart';

import '../../../../controllers/folder_controller.dart';
import '../../../../controllers/searchControler.dart';
import '../../details product/details_product_screen.dart';
import '../function/create_folder_dailog.dart';

class RecentProductGirdView extends StatelessWidget {
  RecentProductGirdView({super.key});

  SearchScreenController searchScreenController =
      Get.put(SearchScreenController());

  FolderController folderController = Get.put(FolderController());

  FolderCreateDialog folderCreateDialog = FolderCreateDialog();

  ProductController productController = Get.put(ProductController());
  ProductDetailsController productDetailsController =
      Get.put(ProductDetailsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => productController.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SizedBox(
            child: Wrap(
            alignment: WrapAlignment.spaceAround,

            // runSpacing: 10.0,
            children:
                productController.product_model!.data!.attributes!.map((item) {
              return GestureDetector(
                onTap: () {
                  productDetailsController.getProductDetailsRepo(
                      item.sId!, item.productName!);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 5.w, top: 5.h, bottom: 5.h),
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white,
                  ),
                  child: Chip(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.r)),
                        side: const BorderSide(
                          color: Colors.transparent,
                        )),
                    label: Image.network(
                      item.productImage!,
                      height: 250,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            }).toList(),
          )));
  }
}
