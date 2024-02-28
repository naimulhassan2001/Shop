
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shop/models/boxes.dart';
import 'package:shop/models/hive_model.dart';
import 'package:shop/views/screens/wishlist/inner_widget/wishlist_item.dart';
import '../../../controllers/wishlist_controller.dart';
import '../../widgets/wishlist_item.dart';
import '../details product/details_product_screen.dart';


class WishlistScreen extends StatelessWidget {
  WishlistScreen({super.key});

  WishlistController wishlistController = Get.put(WishlistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Wishlist"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            const Divider(),
           

            Expanded(
              child: ValueListenableBuilder(
                valueListenable: Boxes.getData().listenable(),
                builder: (context, box, child) {
                  var data = box.values.toList().cast<NotesModel>();
                  return ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      NotesModel noteModel = data[index];
            

            
                      return GestureDetector(
                          onTap: () {
                            // Get.to(ProductDetailPage(
                            //   id: id,
                            //   name: name,
                            //   price: price,
                            //   stockQuantity: stock,
                            //   url: url,
                            //   value: true,
                            // ));
                          },
                          child: WishLisListItem(
                            notesModel: noteModel,
                            
                          ));
                    },
                  );
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
      ),
    );
  }
}
