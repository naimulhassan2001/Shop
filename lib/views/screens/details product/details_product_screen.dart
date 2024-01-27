import 'package:flutter/material.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_string.dart';
import '../../widgets/costom_multiline_text.dart';
import '../../widgets/custom_buton_outline.dart';
import '../../widgets/custom_text.dart';
import 'widget/action.dart';

class DetailsProductScreen extends StatelessWidget {
  DetailsProductScreen({super.key});

  List colorList = [
    const Color(0xFFF5E3DF),
    const Color(0xFFEBEBEB),
    const Color(0xFFE4F2DF),
    const Color(0xFFD5E0ED),
    const Color(0xFF3E3D40),
  ];

  var des =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquet arcu id tincidunt tellus arcu rhoncus, turpis nisl sed. Neque viverra ipsum orci, morbi semper. Nulla bibendum purus tempor semper purus. Ut curabitur platea sed blandit. Amet non at proin justo nulla et. A, blandit morbi suspendisse vel malesuada purus massa mi. Faucibus neque a mi hendrerit.\n\nAudio Technology\nApple-designed dynamic driver\nActive Noise Cancellation\nTransparency mode\nAdaptive EQ\nSpatial audio with dynamic head tracking1\n\nSensors\nOptical sensor (each ear cup)\nPosition sensor (each ear cup)\nCase-detect sensor (each ear cup)\nAccelerometer (each ear cup)\nGyroscope (left ear cup)\n\nMicrophones\nNine microphones total:\nEight microphones for Active Noise Cancellation\nThree microphones for voice pickup (two shared with Active Noise Cancellation and one additional microphone)\n\nChip\nApple H1 headphone chip (each ear cup)\n\nControls\nDigital Crown\nTurn for volume control\nPress once to play, pause or answer a phone call\nPress twice to skip forwards\nPress three times to skip back\nPress and hold for Siri\nNoise control button\nPress to switch between Active Noise Cancellation and Transparency mode\n\nSize and Weight2\nAirPods Max, including cushions\nWeight: 384.8g\n\nSmart Case\nWeight: 134.5g\n\nBattery\nAirPods Max\nUp to 20 hours of listening time on a single charge with Active Noise Cancellation or Transparency mode enabled3\nUp to 20 hours of movie playback on a single charge with spatial audio on4\nUp to 20 hours of talk time on a single charge5\n5 minutes of charge time provides around 1.5 hours of listening time6\nAirPods Max with Smart Case\n\nStorage in the Smart Case preserves battery charge in ultra-low-power state\nCharging via Lightning connector\n\nConnectivity\nBluetooth 5.0\n\nIn the Box\nAirPods Max\nSmart Case\nLightning to USB-C Cable\nDocumentation\nAccessibility7\nAccessibility features help people with disabilities get the most out of their new AirPods Max.\n\nFeatures include:\nLive Listen audio\nHeadphone levels\nHeadphone Accommodations\n\nSystem Requirements8\niPhone and iPod touch models with the latest version of iOS\niPad models with the latest version of iPadOS\nApple Watch models with the latest version of watchOS\nMac models with the latest version of macOS\nApple TV models with the latest version of tvOS";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.detailsProduct),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              children: [
                Icon(Icons.shopping_cart_outlined),
                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("5", style: TextStyle(fontSize: 14)),
                    ))
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                  height: 300,
                  child: Image.asset(
                    AppImages.airPods,
                    fit: BoxFit.fill,
                  )),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(title: AppString.airpodsMaxByApple, fontSize: 16),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          CustomText(
                            title: "\$ 1999,99",
                            fontSize: 18,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          CustomText(
                              title: "( 219 people buy this )",
                              fontWeight: FontWeight.w400),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0x19939393),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(AppImages.love),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              CustomText(
                  title: AppString.chooseTheColor,
                  color: const Color(0xFF939393),
                  fontWeight: FontWeight.w400),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: colorList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        width: 60,
                        height: 40,
                        decoration: ShapeDecoration(
                          color: colorList[index],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Divider(),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Image.asset(AppImages.apple),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        title: AppString.appleStore,
                        fontSize: 16,
                        color: const Color(0xFF393F42),
                      ),
                      CustomText(
                        title: "online 12 mins ago",
                        fontSize: 12,
                        color: const Color(0xFF939393),
                      )
                    ],
                  ),
                  const Spacer(),
                  CustomButtonOutLine(
                    title: AppString.follow,
                    onTap: () {},
                    height: 40,
                    fontSize: 14,
                  )
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 8,
              ),
              CustomText(
                title: AppString.descriptionProduct,
                fontSize: 16,
                color: const Color(0xFF393F42),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomMultiLineText(
                title: des,
              ),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: ProductAction(),
      )
      ,
    );
  }
}
