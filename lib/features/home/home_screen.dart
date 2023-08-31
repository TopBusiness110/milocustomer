

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milocustomer/core/utils/app_colors.dart';
import 'package:milocustomer/features/home/theme1/theme1_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  // static Future<void> loadData(bool reload) async {
  //   Get.find<BannerController>().getBannerList(reload);
  //   Get.find<CategoryController>().getCategoryList(reload);
  //   Get.find<CuisineController>().getCuisineList();
  //   if(Get.find<SplashController>().configModel!.popularRestaurant == 1) {
  //     Get.find<RestaurantController>().getPopularRestaurantList(reload, 'all', false);
  //   }
  //   Get.find<CampaignController>().getItemCampaignList(reload);
  //   if(Get.find<SplashController>().configModel!.popularFood == 1) {
  //     Get.find<ProductController>().getPopularProductList(reload, 'all', false);
  //   }
  //   if(Get.find<SplashController>().configModel!.newRestaurant == 1) {
  //     Get.find<RestaurantController>().getLatestRestaurantList(reload, 'all', false);
  //   }
  //   if(Get.find<SplashController>().configModel!.mostReviewedFoods == 1) {
  //     Get.find<ProductController>().getReviewedProductList(reload, 'all', false);
  //   }
  //   Get.find<RestaurantController>().getRestaurantList(1, reload);
  //   if(Get.find<AuthController>().isLoggedIn()) {
  //     Get.find<RestaurantController>().getRecentlyViewedRestaurantList(reload, 'all', false);
  //     Get.find<UserController>().getUserInfo();
  //     Get.find<NotificationController>().getNotificationList(reload);
  //     Get.find<OrderController>().getRunningOrders(1, notify: false);
  //     Get.find<LocationController>().getAddressList();
  //   }
  // }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   final ScrollController _scrollController = ScrollController();
  // final ConfigModel? _configModel = Get.find<SplashController>().configModel;
  // bool _isLogin = false;

  @override
  void initState() {
    super.initState();

   // _isLogin = Get.find<AuthController>().isLoggedIn();
    //HomeScreen.loadData(false);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.white,// ResponsiveHelper.isDesktop(context) ? AppColors.white : null,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {

          },
          child:   Theme1HomeScreen(
            scrollController: _scrollController,
          )
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;

  SliverDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 50 || oldDelegate.minExtent != 50 || child != oldDelegate.child;
  }
}
