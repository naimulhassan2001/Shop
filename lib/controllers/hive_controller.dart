import 'package:get/get.dart';
import 'package:shop/models/boxes.dart';
import 'package:shop/models/hive_model.dart';

class HiveController extends GetxController {
  RxList isCartAdded = [].obs;

  RxInt number = 0.obs;

  Future<void> addToCart(NotesModel data) async {
    final box = Boxes.getData();

    isCartAdded.value = [];
    for (int i = 0; i < box.length; i++) {
      var aaa = box.getAt(i);
      isCartAdded.add(aaa?.title);
    }

    if (isCartAdded.contains(data.title)) {
    } else {
      box.add(data);
      isCartAdded.add(data.title);
      saveCart();

      Get.snackbar("jkfdhfjd", "hfdhjkdh");

      print("========================================>object");
            print("========================================>4${isCartAdded.length}");

    }
  }

  saveCart() {
    number.value = Boxes.getData().length;
  }
}
