import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/folder_controller.dart';
import '../../../../utils/app_string.dart';
import '../../../widgets/wishlist_item.dart';
import '../folder_details_screen/folder_details_screen.dart';

class FolderListScreen extends StatelessWidget {
  FolderListScreen({super.key, required this.folderName});

  String folderName;

  List folderList = [];

  FolderController folderController = Get.put(FolderController());

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

      Future.delayed(
        const Duration(milliseconds: 200),
        () {
          Get.to(FolderDetailsScreen(
              folderName: item.folderName,
              note: item.note,
              image: item.image,
              productName: item.productName,
              price: item.price));
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.folderName),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.start,

          // runSpacing: 10.0,
          children: folderList.map((item) {
            return GestureDetector(
                onTap: () {
                  // productDetailsController.getProductDetailsRepo(
                  //     item.sId!, item.title);
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
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.6),
                            borderRadius: const BorderRadius.all(Radius.circular(30))
                        ),
                        child: Column(
                          children: [
                            Text("Folder: ${item.folderName}", style: TextStyle(fontSize: 18,color: Colors.white),),
                            Text("Note: ${item.note}", style: TextStyle(fontSize: 18,color: Colors.white),),
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
