import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: searchScreenController.products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 4 / 5, crossAxisCount: 2),
        itemBuilder: (context, index) {
          var product = searchScreenController.products[index];
          var image = product['image'];
          var name = product['name'];
          var price = product['price'];

          return GestureDetector(
            onTap: () {
              Get.to(DetailsProductScreen());
            },
            child: Card(
              elevation: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 8,
                    child: Image.asset(
                      image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  // Expanded(
                  //   flex: 4,
                  //   child: Column(
                  //     children: [
                  //       Text(name),
                  //       Text(price),
                  //       // Row(
                  //       //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //       //   children: [
                  //       //     IconButton(
                  //       //         onPressed: () {},
                  //       //         icon: CircleAvatar(
                  //       //             radius: 20.r,
                  //       //             backgroundColor: Colors.black12,
                  //       //             child: const Icon(Icons.favorite_border))),
                  //       //     IconButton(
                  //       //         onPressed: () {
                  //       //           folderCreateDialog.createFolder(
                  //       //               context, name, image, price);
                  //       //         },
                  //       //         icon: CircleAvatar(
                  //       //             radius: 20.r,
                  //       //             backgroundColor: Colors.black12,
                  //       //             child: const Icon(Icons.edit_calendar))),
                  //       //   ],
                  //       // )
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
