
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:masonry_list_view_grid/masonry_list_view_grid.dart';

import '../../../controllers/folder_controller.dart';
import '../../../utils/app_string.dart';
import 'folder_list_screen/folder_list_screen.dart';

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
        title: const Text(
          AppString.yourFolder,
          style: TextStyle(color: Color(0xFF54A630)),
        ),
      ),
      body: MasonryListViewGrid(
          column: 2,
          padding: const EdgeInsets.all(8.0),
          children: List.generate(
            folder.length,
            (index) {
              var item = folder[index];
              return GestureDetector(
                onTap: () {
                  Get.to(FolderListScreen(
                    folderName: item.folderName,
                  ));
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
                            left: 16,
                            bottom: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
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
