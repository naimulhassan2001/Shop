import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shop/models/boxes.dart';
import 'package:shop/models/hive_model.dart';
import 'package:shop/views/screens/wishlist/inner_widget/wishlist_item.dart';
import '../../../controllers/hive_controller.dart';
import '../../../controllers/wishlist_controller.dart';
import '../../widgets/wishlist_item.dart';
import '../details product/details_product_screen.dart';

class WishlistScreen extends StatelessWidget {
  WishlistScreen({super.key});

  WishlistController wishlistController = Get.put(WishlistController());
  HiveController hiveController = Get.put(HiveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist", style: TextStyle(color: Colors.green),),
      ),
      body: Column(
        children: [

          Expanded(
            child: ValueListenableBuilder(
              valueListenable: Boxes.getData().listenable(),
              builder: (context, box, child) {
                var data = box.values.toList().cast<NotesModel>();
                return Wrap(
                  alignment: WrapAlignment.start,

                  // runSpacing: 10.0,
                  children: box.values.map((item) {
                    return GestureDetector(
                        onTap: () {
                          // productDetailsController.getProductDetailsRepo(
                          //     item.sId!, item.title);
                        },
                        child: Stack(children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 5.w, top: 5.h, bottom: 5.h),
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
                          Positioned(
                              right: 0,
                              bottom: 8,
                              child: IconButton(
                                  onPressed: () {
                                    print(
                                        "before=========================${hiveController.isCartAdded}");
                                    item.delete();
                                    hiveController.cartList();
                                    hiveController.saveCart();
                                  },
                                  icon: const Icon(Icons.delete, color: Colors.red,)))
                        ]));
                  }).toList(),
                );
                // return ListView.builder(
                //   itemCount: box.length,
                //   itemBuilder: (context, index) {
                //     NotesModel noteModel = data[index];
                //
                //
                //
                //     return GestureDetector(
                //         onTap: () {
                //           // Get.to(ProductDetailPage(
                //           //   id: id,
                //           //   name: name,
                //           //   price: price,
                //           //   stockQuantity: stock,
                //           //   url: url,
                //           //   value: true,
                //           // ));
                //         },
                //         child: WishLisListItem(
                //           notesModel: noteModel,
                //
                //         ));
                //   },
                // );
              },
            ),
          ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             ElevatedButton(
          //                 style: ElevatedButton.styleFrom(
          //                     backgroundColor:  Colors.blue),
          //                 onPressed: () {
          //                   if (cartController.number.value != 0) {
          //                     Get.to(Payment(
          //                       price: cartController.setAllPrice(),
          //                       onTap: onTap,
          //                     ));
          //                   } else {
          //                     Get.snackbar(ConstString.cart, ConstString.cartIsEmpty);
          //                   }
          //                 },
          //                 child: const Text(ConstString.checkOut, style: TextStyle(color: Colors.white),)),
          //           ],
          //         ),
          // );
        ],
      ),
    );
  }
}
