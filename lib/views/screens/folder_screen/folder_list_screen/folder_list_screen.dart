import 'package:flutter/material.dart';
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
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: folderList.length,
          itemBuilder: (context, index) {
            var item = folderList[index];

            return GestureDetector(
              onTap: () {
                Get.to(FolderDetailsScreen(
                    folderName: item.folderName,
                    note: item.note,
                    image: item.image,
                    productName: item.productName,
                    price: item.price));
              },
              child: ProductListItem(
                  name: item.productName,
                  image: item.image,
                  variant: "Gray",
                  price: item.price),
            );
          }),
    );
  }
}
