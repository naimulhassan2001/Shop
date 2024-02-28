import 'package:get/get.dart';
import 'package:shop/models/boxes.dart';
import 'package:shop/models/hive_model.dart';

class HiveController extends GetxController {
  RxList isCartAdded = [].obs;

  RxInt number = 0.obs;

  cartList() {
    final box = Boxes.getData();

    isCartAdded.value = [];

    for (int i = 0; i < box.length; i++) {
      var aaa = box.getAt(i);
      isCartAdded.add(aaa?.title);
    }

    print("after =========================${isCartAdded}");
  }

  Future<void> addToCart(NotesModel data) async {
    final box = Boxes.getData();

    isCartAdded.value = [];
    for (int i = 0; i < box.length; i++) {
      var aaa = box.getAt(i);
      isCartAdded.add(aaa?.title);
    }

    if (isCartAdded.contains(data.title)) {
      delete(data.title);

    } else {
      box.add(data);
      isCartAdded.add(data.title);
      saveCart();

      Get.snackbar("wishlist Added", data.title);

      print("========================================>object");
      print("========================================>4${isCartAdded.length}");
    }
  }

  saveCart() {
    number.value = Boxes.getData().length;
  }

  delete(String title) {
    final box = Boxes.getData();
    isCartAdded.remove(title);
    saveCart();

    for (int i = 0; i < box.length; i++) {
      var aaa = box.getAt(i);
      if (title == aaa!.title) {
        aaa.delete();

        Get.snackbar("wishlist Remove", title);

      }
    }
  }
}
