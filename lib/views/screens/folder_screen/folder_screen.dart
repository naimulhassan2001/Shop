import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/folder_controller.dart';
import '../../../utils/app_string.dart';
import 'folder_list_screen/folder_list_screen.dart';
import 'inner_widget/folder_item.dart';

class FolderScreen extends StatelessWidget {
  FolderScreen({super.key});

  FolderController folderController = Get.put(FolderController());

  List folder = [];
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < folderController.folderList.length; i++) {
      var item = folderController.folderList[i];

      if (folder.isEmpty) {
        folder.add(item);
      } else {
        try {
          folder.forEach((element) {
            if (element.folderName == item.folderName) {
              isAdded = true;
            }
          });

          if (isAdded) {
            isAdded = false;
          } else {
            folder.add(item);
            isAdded = false;
          }
        } catch (e) {}
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.yourFolder, style: TextStyle(color: Color(0xFF54A630)),),
      ),
      body: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.start,

            // runSpacing: 10.0,
            children: folder.map((item) {
              return GestureDetector(
                  onTap: () {
                    Get.to(FolderListScreen(
                      folderName: item.folderName,
                    ));
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                      children: [
                    Container(
                      margin: EdgeInsets.only(left: 5.w, top: 5.h, bottom: 5.h),
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
                    //         icon: const Icon(
                    //           Icons.delete,
                    //           color: Colors.red,
                    //         ))),
                    Positioned(
                        left: 16,
                        bottom: 8,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
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
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 12, color: Colors.white),
                              ),

                            ],
                          ),
                        ))
                  ]));
            }).toList(),
          )),
    );
  }
}
