import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/services/api_services/api_services.dart';
import 'package:shop/utils/app_url/app_urls.dart';
import 'package:shop/views/screens/home/home_screen.dart';
import 'package:shop/views/screens/profile/profile_screen.dart';

import '../views/widgets/bottom_nav_bar.dart';

class SignInController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  static var token;

  Future<void> signInRepo() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var body = {
      "email": emailController.text,
      "password": passwordController.text
    };

    var data = await ApiService.postApi(AppUrls.signIn, body, {}, isHeader: false);

    // print(data.statusCode);
    // print(data.message);

    if(data.statusCode == 200){
      var responseData = jsonDecode(data.responseJson);
      token = responseData["data"]["token"];
      await prefs.setString('token', token);
      Get.to(ProfileScreen());
    }



  }
}