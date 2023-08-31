
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milocustomer/core/widgets/custom_image.dart';
import 'package:milocustomer/core/widgets/title_widget.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CuisinesView extends StatelessWidget {
  const CuisinesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: TitleWidget(
            title: 'مطاعم وطهاة جدد',
            onTap: () => {

            }
                // Get.toNamed(RouteHelper.getCuisineRoute())
        ),
      ),
      // cuisineController.cuisineModel != null
           SizedBox(
        child: ListView.builder(

          // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //   crossAxisCount: 4,
          //   mainAxisSpacing: Dimensions.paddingSizeSmall,
          //   crossAxisSpacing: Dimensions.paddingSizeLarge,
          //   //childAspectRatio: 0.8,
          // ),
            shrinkWrap: true,
            itemCount:10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  // Get.toNamed(
                      // RouteHelper.getCuisineRestaurantRoute(
                      //     cuisineController.cuisineModel!
                      //         .cuisines![index].id,
                      //     cuisineController.cuisineModel!
                      //         .cuisines![index].name));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CustomImage(
                      fit: BoxFit.fitWidth,
                      width: 100,
                      height: 50,
                      image:
                      "https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg",

                    ),
                  ),
                ),
              );
            }),
        height: 180,
      )
          // : CuisineShimmer(cuisineController: cuisineController)
    ]);
  }
}

// class CuisineShimmer extends StatelessWidget {
//   final CuisineController cuisineController;
//
//   const CuisineShimmer({Key? key, required this.cuisineController})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 75,
//       child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 4,
//             mainAxisSpacing: Dimensions.paddingSizeSmall,
//             crossAxisSpacing: Dimensions.paddingSizeLarge,
//             childAspectRatio: 0.8,
//           ),
//           shrinkWrap: true,
//           itemCount: ResponsiveHelper.isMobile(context) ? 8 : 10,
//           scrollDirection: Axis.vertical,
//           physics: const NeverScrollableScrollPhysics(),
//           itemBuilder: (context, index) {
//             return Shimmer(
//               duration: const Duration(seconds: 2),
//               enabled: cuisineController.cuisineModel == null,
//               child: Column(children: [
//                 Expanded(
//                   child: ClipRRect(
//                     borderRadius:
//                         BorderRadius.circular(Dimensions.radiusDefault),
//                     child: Container(
//                         decoration: BoxDecoration(
//                       color: Colors.grey[300],
//                       borderRadius:
//                           BorderRadius.circular(Dimensions.radiusSmall),
//                     )),
//                   ),
//                 ),
//                 const SizedBox(height: Dimensions.paddingSizeExtraSmall),
//                 Container(
//                     decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
//                 )),
//               ]),
//             );
//           }),
//     );
//   }
// }
