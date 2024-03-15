import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/product_controller.dart';
import 'package:shop/controllers/product_details_controller.dart';

import '../../../../controllers/folder_controller.dart';
import '../../../../utils/app_string.dart';
import '../../../widgets/wishlist_item.dart';
import '../folder_details_screen/folder_details_screen.dart';

class FolderListScreen extends StatelessWidget {
  FolderListScreen({super.key, required this.folderName});

  String folderName;

  List folderList = [];

  FolderController folderController = Get.put(FolderController());
  ProductDetailsController productDetailsController = Get.put(ProductDetailsController());

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < folderController.folderList.length; i++) {
      var item = folderController.folderList[i];
      if (item.folderName == folderName) {
        folderList.add(item);
      }
    }

    if (folderList.length == 1) {
      var item = folderList[0];

      print(item) ;

      Future.delayed(
        const Duration(milliseconds: 200),
        () {
          productDetailsController.getProductDetailsRepo(
              item.id!, item.productName!);

        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
            folderList[0].folderName,
          style: const TextStyle(
            color: Color(0xFF54A630)
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.start,

          // runSpacing: 10.0,
          children: folderList.map((item) {
            return GestureDetector(
                onTap: () {
                  productDetailsController.getProductDetailsRepo(
                      item.id!, item.productName!);
                },
                child: Stack(children: [
                  Container(
                    margin:
                    EdgeInsets.only(left: 5.w, top: 5.h, bottom: 5.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.white,
                    ),
                    child: Chip(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(16.r)),
                          side: const BorderSide(
                            color: Colors.transparent,
                          )),
                      label: Image.network(
                        item.image,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  // Positioned(
                  //     right: 0,
                  //     bottom: 8,
                  //     child: IconButton(
                  //         onPressed: () {
                  //           // print(
                  //           //     "before=========================${hiveController.isCartAdded}");
                  //           // item.delete();
                  //           // hiveController.cartList();
                  //           // hiveController.saveCart();
                  //         },
                  //         // icon: const Icon(
                  //         //   Icons.delete,
                  //         //   color: Colors.red,
                  //         // )
                  //     )),
                  Positioned(
                      left: 16,
                      bottom: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              "Folder: ${item.folderName}",
                              style: const TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            Text(
                              "Note: ${item.note}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 12, color: Colors.white),
                            ),

                          ],
                        ),
                      ))

                ]));
          }).toList(),
        ),
      ),
    );
  }
}
