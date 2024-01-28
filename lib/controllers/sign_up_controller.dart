


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop/services/api_services/api_services.dart';
import 'package:shop/utils/app_url/app_urls.dart';
import 'package:shop/views/screens/sign_in/sign_in.dart';

class SignUpController extends GetxController {


  TextEditingController nameController = TextEditingController() ;
  TextEditingController emailController = TextEditingController() ;
  TextEditingController numberController = TextEditingController() ;
  TextEditingController passwordController = TextEditingController() ;
  TextEditingController confirmPasswordController = TextEditingController() ;





  Future<void> signUpRepo() async{

    var body = {
      "fullName": nameController.text,
      "email": emailController.text,
      "phoneNumber": numberController.text,
      "role":"user",
      "password": passwordController.text
    } ;


    
   var data = await ApiService.postApi(AppUrls.signUp, body, {} , isHeader: false) ;

   if(data.statusCode == 200){
     Get.to(SignInScreen());
   }

   print(data) ;
   print(data.message) ;

   var bodyJson = jsonDecode(data.responseJson) ;

   print(bodyJson) ;





  }





}