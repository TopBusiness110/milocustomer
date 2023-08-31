
import 'package:flutter/material.dart';
import 'package:milocustomer/config/routes/app_routes.dart';
import 'package:milocustomer/core/utils/getSize.dart';
import 'package:milocustomer/core/widgets/custom_image.dart';
import 'package:milocustomer/core/widgets/title_widget.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:get/get.dart';


class ItemCampaignView1 extends StatelessWidget {
  const ItemCampaignView1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
          child: TitleWidget(title: 'مقدمي الخدمة الأقرب إلى منطقتك'.tr, onTap: () =>
            {
          //    Navigator.pushNamed(context, Routes.restaurantdetaialScreen)

            }),
        ),

        SizedBox(
          height: 180,
          child:
          // campaignController.itemCampaignList != null ?
          ListView.builder(
            controller: ScrollController(),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding:  EdgeInsets.only(left: getSize(context)/22),
            itemCount: 10,
            itemBuilder: (context, index){
              return Padding(
                padding:  EdgeInsets.only(right: getSize(context)/40, bottom: 5),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.restaurantdetaialScreen);

                    // Get.toNamed(RouteHelper.getRestaurantDetails());
                    // ResponsiveHelper.isMobile(context) ? Get.bottomSheet(
                    //   ProductBottomSheet(product: campaignController.itemCampaignList![index], isCampaign: true),
                    //   backgroundColor: Colors.transparent, isScrollControlled: true,
                    // ) : Get.dialog(
                    //   Dialog(child: ProductBottomSheet(product: campaignController.itemCampaignList![index], isCampaign: true)),
                    // );
                  },
                  child: Stack(
                    children: [
                      ClipRRect(

                        borderRadius: BorderRadius.circular(getSize(context)/24),
                        child: CustomImage(
                          image:     "https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg",

                          height: 180, width: 250, fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,

                          child: Container(height: 70,

                            color:Colors.yellow,
                          )),
                      Positioned(
                        right:Get.locale!.languageCode=='ar'? 4:0,
                        left:Get.locale!.languageCode=='en'? 4:0,
                        bottom: 10,
                        child:   Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CustomImage(
                                image: "https://99designs-blog.imgix.net/blog/wp-content/uploads/2019/10/attachment_103367090-e1571110045215.jpg?auto=format&q=60&fit=max&w=930",
                                height: 80, width: 80, fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 4,),
                            Text(
                              'Al Rayyan Restaurant',
                              style: TextStyle(fontSize: 10, color: Colors.black),
                            )

                          ],
                        ),)
                    ],
                  ),
                ),
              );
            },
          )
              // : ItemCampaignShimmer(campaignController: campaignController),
        ),
      ],
    );
  }
}

// class ItemCampaignShimmer extends StatelessWidget {
//   final CampaignController campaignController;
//   const ItemCampaignShimmer({Key? key, required this.campaignController}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const BouncingScrollPhysics(),
//       scrollDirection: Axis.horizontal,
//       padding: const EdgeInsets.only(left: getSize(context)/22),
//       itemCount: 10,
//       itemBuilder: (context, index){
//         return Padding(
//           padding: const EdgeInsets.only(right: getSize(context)/22, bottom: 5),
//           child: Shimmer(
//             duration: const Duration(seconds: 2),
//             enabled: campaignController.itemCampaignList == null,
//             child: Container(
//               height: 180, width: 250,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
//                 color: Colors.grey[300],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

