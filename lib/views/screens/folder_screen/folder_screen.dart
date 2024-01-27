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
  bool isAdded = false ;

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
              isAdded = true ;
            }
          });

          if(isAdded){
            isAdded = false ;
          } else{
            folder.add(item) ;
            isAdded = false ;
          }
        } catch (e) {}
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.yourFolder),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child:ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: folder.length,
            itemBuilder: (context, index) {
              var item = folder[index];
              return GestureDetector(
                onTap: () {
                  Get.to(FolderListScreen(
                    folderName: item.folderName,
                  ));
                },
                child: FolderItem(
                    folderName: item.folderName,
                    note: item.note,
                    image: item.image),
              );
            },
          )),
    );
  }
}
