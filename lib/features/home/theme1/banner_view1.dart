
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milocustomer/core/utils/app_colors.dart';
import 'package:milocustomer/core/utils/getSize.dart';
import 'package:milocustomer/core/widgets/custom_image.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class BannerView1 extends StatelessWidget {
  const BannerView1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return



      Container(
        width: MediaQuery.of(context).size.width,
        height: GetPlatform.isDesktop ? 500 : MediaQuery.of(context).size.width * 0.45,
        padding:  EdgeInsets.only(top: getSize(context)/30),
        child:
        // bannerList != null ?
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  disableCenter: true,
                 // viewportFraction: .99,
                  autoPlayInterval: const Duration(seconds: 7),
                  onPageChanged: (index, reason) {
                  //  bannerController.setCurrentIndex(index, true);
                  },
                ),
                itemCount: 10,
                itemBuilder: (context, index, _) {
                  String? baseUrl =    "https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg";
                  return InkWell(
                    onTap: () {

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 800 : 200]!, spreadRadius: 1, blurRadius: 5)],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child:
                         CustomImage(
                            image: '$baseUrl}',
                            fit: BoxFit.cover,
                          )

                      ),
                    ),
                  );
                },
              ),
            ),

             SizedBox(height: getSize(context)/40),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: bannerList.map((bnr) {
            //     int index = bannerList.indexOf(bnr);
            //     return TabPageSelectorIndicator(
            //       backgroundColor: index == bannerController.currentIndex ? AppColors.primary
            //           : AppColors.primary.withOpacity(0.5),
            //       borderColor: AppColors.colorScheme.background,
            //       size: index == bannerController.currentIndex ? 10 : 7,
            //     );
            //   }).toList(),
            // ),

          ],
        )
            // :
        // Shimmer(
        //   duration: const Duration(seconds: 2),
        //   enabled: bannerList == null,
        //   child: Container(margin: const EdgeInsets.symmetric(horizontal: 10), decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(30),
        //     color: Colors.grey[300],
        //   )),
        // ),
      );

  }

}