
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 3,
                  itemBuilder: (context, index) {
                    var item = wishlistController.wishList[index];
                    return GestureDetector(
                      onTap: (){
                        Get.to(DetailsProductScreen());
                      },
                      child: ProductListItem(
                          name: item["name"],
                          image: item["image"],
                          variant: item["variant"],
                          price: item["price"]),
                    );
                  },),
            )
          ],
        ),
      ),
    );
  }
}
