import 'package:get/get.dart';

class FolderController extends GetxController {
  RxList folderNameList = [].obs;

  RxList folderList = [

  ].obs;

  aaaaaa() {
    folderNameList.value = [];

    for (int i = 0; i < folderList.length; i++) {
      var item = folderList[i];

      print("=========================> ${item.productName}");

      if (folderNameList.isEmpty) {
        folderNameList.add(item);
      } else {
        try {
          folderNameList.forEach((element) {
            if (element.folderName == item.folderName) {
              folderNameList.add(item);

              print("=========================> ${element.folderName}");
            }
          });
        } catch (e) {}
      }
    }
  }
}
