import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenSilder extends StatefulWidget {
  const HomeScreenSilder({super.key});

  @override
  State<HomeScreenSilder> createState() => _HomeScreenSilderState();
}

class _HomeScreenSilderState extends State<HomeScreenSilder> {
  //crete a image list for slide this image one by one
  List  images = [
    "assets/images/slider1.png",
    "assets/images/slider2.png",
    "assets/images/slider3.png",
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
            itemCount: images.length,
            options: CarouselOptions(
              autoPlay: true,
              height: 200.h,
              aspectRatio: 5.5,
              autoPlayAnimationDuration: const Duration(seconds: 1),
              reverse: false,
            ),
            itemBuilder: (context, index, realIndex) {
              return GestureDetector(
                child: Container(
                  height: 200.h,
                  width: 400.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13.r),
                    child: Image.asset(images[index]),
                  ),
                ),
              );
            },
          );
  }
}