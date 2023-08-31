
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:milocustomer/core/utils/app_colors.dart';
import 'package:milocustomer/core/utils/assets_manager.dart';
import 'package:milocustomer/core/utils/getSize.dart';
import 'package:milocustomer/features/home/home_screen.dart';
import 'package:milocustomer/features/home/theme1/banner_view1.dart';
import 'package:milocustomer/features/home/theme1/category_view1.dart';
import 'package:milocustomer/features/home/theme1/cuisine_view.dart';
import 'package:milocustomer/features/home/theme1/item_campaign_view1.dart';
// import 'package:milocustomer/features/home/widget/bad_weather_widget.dart';


class Theme1HomeScreen extends StatelessWidget {
  final ScrollController scrollController;
  const Theme1HomeScreen({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ConfigModel configModel = Get.find<SplashController>().configModel!;
    // bool isLogin = Get.find<AuthController>().isLoggedIn();

    return CustomScrollView(
      controller: scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [

        // App Bar
        SliverAppBar(
          floating: true, elevation: 0, automaticallyImplyLeading: false,
          backgroundColor:  AppColors.white,
          title: Center(child: Container(
            width: getSize(context), height: 50, color: AppColors.white,
            child: Row(children: [
              Expanded(child: InkWell(
                onTap: () =>
              {

              }
                  //  Get.toNamed(RouteHelper.getAccessLocationRoute('home')
                    ,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: getSize(context)/40,
                    horizontal: 0,
                  ),
                  child:  Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
              Icons.home_filled
                           ,
                        size: 20, color: AppColors.primary,
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          '',
                         // locationController.getUserAddress()!.address!,
                          style:TextStyle(
                            color: AppColors.primary,
                            fontSize:getSize(context)/24,
                          ),
                          maxLines: 1, overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down, color: AppColors.primary),
                    ],
                  ),
                ),
              )),
              InkWell(
                child:Stack(children: [
                  Icon(Icons.notifications, size: 25,
                      color: AppColors.primary),
                  // notificationController.hasNotification ?
                  Positioned(top: 0, right: 0, child: Container(
                    height: 10, width: 10, decoration: BoxDecoration(
                    color: AppColors.primary, shape: BoxShape.circle,
                    border: Border.all(width: 1, color: AppColors.white),
                  ),
                  ))
                      // : const SizedBox(),
                ]),
                onTap: () =>
                {
                 // Get.toNamed(RouteHelper.getNotificationRoute()),
                }),
            ]),
          )),
          actions: const [SizedBox()],
        ),

        // Search Button
        SliverPersistentHeader(
          pinned: true,
          delegate: SliverDelegate(child: Center(child: Container(
            height: 50, width: getSize(context),
            color: AppColors.white,
            padding:  EdgeInsets.symmetric(horizontal: getSize(context)/22),
            child: InkWell(
              onTap: () =>{

    },
                  // Get.toNamed(RouteHelper.getSearchRoute()),
              child: Container(
                padding:  EdgeInsets.symmetric(horizontal: getSize(context)/22),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [BoxShadow(color: Colors.grey[ 200]!, spreadRadius: 1, blurRadius: 5)],
                ),
                child: Row(children: [
                   SizedBox(width: getSize(context)/40),
                  Icon(
                    Icons.search, size: 25,
                    color: AppColors.hint,
                  ),
                   SizedBox(width:  getSize(context)/40),
                  Expanded(child: Text(
                    'search_food_or_restaurant'.tr(),
                    style: TextStyle(
                      fontSize:  getSize(context)/24, color: AppColors.hint,
                    ),
                  )),
                ]),
              ),
            ),
          ))),
        ),

        SliverToBoxAdapter(
          child: Center(child: SizedBox(
            width: getSize(context),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              SizedBox(height: 5,),
             // const BadWeatherWidget(),
              const CategoryView1(),
              const BannerView1(),

         //
               const ItemCampaignView1(),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Stack(
             children: [
               Positioned(

                 child: Padding(
                   padding: const EdgeInsets.only(top: 30.0),
                   child: Container(

                     width: MediaQuery.of(context).size.width,
height: 100,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(30)),
                       gradient: LinearGradient(
                         colors: [
                           Colors.orange,
                           Colors.white
                         ]
                       )
                     ),
                     child: Row(
                       children: [
                         SizedBox(width: 10,),
                         Icon(
                           Icons.percent, size: 50,
                           color: AppColors.hint,
                         ),
                         Expanded(
                           child: Center(
                             child: Text(
   " كن عميلاً خاصًا لـ Mealioواستفد من الخصومات الجذابة على أي طلب"

                              ,
                               textAlign: TextAlign.start,
                               overflow: TextOverflow.ellipsis,
                               maxLines: 20,

                               style: TextStyle(fontSize: 16, color: Colors.black,),
                             ),
                           ),
                         ),
                         SizedBox(width: 40,),


                       ],

                     ),
                   ),
                 ),



               ),
               EasyLocalization.of(context)!.currentLocale!.languageCode=='ar'?
               Positioned(

                   left: 0,

                   child: Image.asset(ImageAssets.userIcon, height: 140, width: 90,fit: BoxFit.cover,)):Positioned(

right: 0,

                   child: Image.asset(ImageAssets.userIcon, height: 140, width: 90,fit: BoxFit.cover,)),
             ],
           ),
         ),

         //      configModel.mostReviewedFoods == 1 ? const BestReviewedItemView() : const SizedBox(),
         //      isLogin ? const PopularStoreView1(isPopular: false, isRecentlyViewed: true) : const SizedBox(),
               const CuisinesView(),
         //      configModel.popularRestaurant == 1 ? const PopularStoreView1(isPopular: true) : const SizedBox(),
         //      const NearByButtonView(),
         //      configModel.popularFood == 1 ? const PopularItemView1(isPopular: true) : const SizedBox(),
         //      configModel.newRestaurant == 1 ? const PopularStoreView1(isPopular: false) : const SizedBox(),
         //
         //      Padding(
         //        padding: const EdgeInsets.fromLTRB(10, 15, 0, 5),
         //        child: Row(children: [
         //          Expanded(child: Text(
         //            'all_restaurants'.tr,
         //            style: robotoMedium.copyWith(fontSize: getSize(context)/24),
         //          )),
         //          const FilterView(),
         //        ]),
         //      ),
         //
         //      GetBuilder<RestaurantController>(builder: (restaurantController) {
         //        return PaginatedListView(
         //          scrollController: scrollController,
         //          totalSize: restaurantController.restaurantModel != null ? restaurantController.restaurantModel!.totalSize : null,
         //          offset: restaurantController.restaurantModel != null ? restaurantController.restaurantModel!.offset : null,
         //          onPaginate: (int? offset) async => await restaurantController.getRestaurantList(offset!, false),
         //          productView: ProductView(
         //            isRestaurant: true, products: null, showTheme1Restaurant: true,
         //            restaurants: restaurantController.restaurantModel != null ? restaurantController.restaurantModel!.restaurants : null,
         //            padding: EdgeInsets.symmetric(
         //              horizontal: ResponsiveHelper.isDesktop(context) ? Dimensions.paddingSizeExtraSmall : getSize(context)/22,
         //              vertical: ResponsiveHelper.isDesktop(context) ? Dimensions.paddingSizeExtraSmall : 0,
         //            ),
         //          ),
         //        );
         //      }),

            ]),
          )),
        ),
      ],
    );
  }
}
