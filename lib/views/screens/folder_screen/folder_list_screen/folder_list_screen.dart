import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:masonry_list_view_grid/masonry_list_view_grid.dart';
import 'package:shop/controllers/product_details_controller.dart';

import '../../../../controllers/folder_controller.dart';

class FolderListScreen extends StatelessWidget {
  FolderListScreen({super.key, required this.folderName});

  String folderName;

  List folderList = [];

  FolderController folderController = Get.put(FolderController());
  ProductDetailsController productDetailsController =
      Get.put(ProductDetailsController());

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
          productDetailsController.getProductDetailsRepo(
              item.id!, item.productName!);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          folderList[0].folderName,
          style: const TextStyle(color: Color(0xFF54A630)),
        ),
      ),
      body: MasonryListViewGrid(
          column: 2,
          padding: const EdgeInsets.all(8.0),
          children: List.generate(
            folderList.length,
            (index) {
              var item = folderList[index];
              return GestureDetector(
                onTap: () {
                  productDetailsController.getProductDetailsRepo(
                      item.id!, item.productName!);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(
                      color: const Color(0xFF54A630),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(0, 0))
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: Stack(
                      children: [
                        Image.network(
                          item.image,
                          fit: BoxFit.fitHeight,
                        ),
                        Positioned(
                            left: 0,
                            bottom: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    "Folder: ${item.folderName}",
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  Text(
                                    "Note: ${item.note}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
