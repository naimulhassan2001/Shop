import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'themes/theme_light.dart';
import 'views/screens/sign_in/sign_in.dart';
import 'views/screens/sign_up/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return GetMaterialApp(
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          home: SignInScreen(),
          //   home: SearchScreen(),
          // home: DetailsProductScreen(),
          //  home: YourCartScreen(),
          // home: PaymentMethodScreen(),
          // home: CheckoutScreen(),
        ) ;
      },
    );
  }
}
