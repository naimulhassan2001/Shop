import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shop/helpers/share_pref_helper.dart';
import 'package:shop/models/ProductDetails_Model.dart';
import 'package:shop/services/api_services/api_services.dart';
import 'package:shop/utils/app_url/app_urls.dart';
import 'package:shop/views/screens/details%20product/details_product_screen.dart';
import 'package:http/http.dart' as http;

class ProductDetailsController extends GetxController {
  ProductDetails_Model? productDetails_Model;
  RxBool isLoading = false.obs;

  Future<void> getProductDetailsRepo(String productId, name) async {
    isLoading.value = true;
    var data = await ApiService.getApi("${AppUrls.product}/$productId",
        {"Authorization": "Bearer ${SharePrefHelper.token}"});

    isLoading(false);
    if (data.statusCode == 200) {
      var responseData = jsonDecode(data.responseJson);
      productDetails_Model = ProductDetails_Model.fromJson(responseData);
      print('Status Code: ${data.statusCode}');
      print('Message: ${data.message}');
      Get.to(DetailsProductScreen(name: name));
    } else {
      // Handle the error case here
      print('Error: ${data.statusCode}');
      print('Error message: ${data.message}');
    }
  }

  Future<void> downloadImage(String url) async {
    final response = await http.get(Uri.parse(url));
    final Uint8List bytes = response.bodyBytes;

    final result = await ImageGallerySaver.saveImage(bytes);

    if (result['isSuccess']) {
      // Image saved successfully

      Get.snackbar("image", "Image downloaded");
    } else {
      // Error saving image
      Get.snackbar("image", "download failed");
    }
  }
}
