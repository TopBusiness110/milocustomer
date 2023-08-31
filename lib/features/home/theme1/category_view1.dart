
import 'package:flutter/material.dart';
import 'package:milocustomer/config/routes/app_routes.dart';
import 'package:milocustomer/core/utils/getSize.dart';
import 'package:milocustomer/core/widgets/custom_image.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:get/get.dart';

class CategoryView1 extends StatelessWidget {
  const CategoryView1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    return   Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        //   child: TitleWidget(title: 'categories'.tr, onTap: () => Get.toNamed(RouteHelper.getCategoryRoute())),
        // ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 120,
                child:
                // categoryController.categoryList != null ?
                ListView.builder(
                  controller: scrollController,
                  itemCount: 10,
                  padding:  EdgeInsets.only(left: getSize(context)/22),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: InkWell(
                        onTap: () => {
                          Navigator.pushNamed(context, Routes.storyScreen)
                       //   Get.toNamed(RouteHelper.getStroy())

                        }
                        //     Get.toNamed(RouteHelper.getCategoryProductRoute(
                        // //  categoryController.categoryList![index].id, categoryController.categoryList![index].name!,
                        // )
                        ,
                        child: SizedBox(
                          height: 120,
                          child: Container(
                            height: 100, width: 100,
                            margin: EdgeInsets.only(
                              left: index == 0 ? 0 :
                             getSize(context)/40,
                              right: getSize(context)/40,
                            ),
                            child: Column(children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,

                                    border: Border.all(color:Colors.blue,width: 3)
                                ),
                                child: ClipOval(

                                  //  borderRadius: BorderRadius.circular(100),
                                  child: CustomImage(
                                    image:'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg',

                                    height: 65, width: 65, fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 2),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle
                                  // borderRadius: const BorderRadius.vertical(bottom: Radius.circular(Dimensions.radiusSmall)),
                                  //  color: AppColors.primary.withOpacity(0.8),
                                ),
                                child: Text(
                                  "محمد", maxLines: 1, overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize:
                                  getSize(context)/24, color: Colors.black),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    );
                  },
                )
                    //:
                // CategoryShimmer(categoryController: categoryController),
              ),
            ),

            // ResponsiveHelper.isMobile(context) ?
            const SizedBox()
            //     :
            // categoryController.categoryList != null ? Column(
            //   children: [
            //     InkWell(
            //       onTap: (){
            //         showDialog(context: context, builder: (con) => Dialog(child: SizedBox(height: 550, width: 600, child: CategoryPopUp(
            //           categoryController: categoryController,
            //         ))));
            //       },
            //       child: Padding(
            //         padding: const EdgeInsets.only(right: getSize(context)/22),
            //         child: CircleAvatar(
            //           radius: 35,
            //           backgroundColor: AppColors.primary,
            //           child: Text('view_all'.tr, style: TextStyle(fontSize: Dimensions.paddingSizeDefault, color: AppColors.white)),
            //         ),
            //       ),
            //     ),
            //     const SizedBox(height: 10,)
            //   ],
            // ): CategoryAllShimmer(categoryController: categoryController)
          ],
        ),

      ],
    );
    //   GetBuilder<CategoryController>(builder: (categoryController) {
    //   return (categoryController.categoryList != null && categoryController.categoryList!.isEmpty) ? const SizedBox() :
    //
    // });
  }
}

class CategoryShimmer extends StatelessWidget {
  // final CategoryController categoryController;
  const CategoryShimmer({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.builder(
        itemCount: 14,
        padding:  EdgeInsets.only(left: getSize(context)/40),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: SizedBox(
              width: 100,
              child: Container(
                height: 100, width: 100,
                margin: EdgeInsets.only(
                  left: index == 0 ? 0 : getSize(context)/40,
                  right: getSize(context)/40,
                ),
                child: Shimmer(
                  duration: const Duration(seconds: 2),
                  // enabled: categoryController.categoryList == null,
                  child: Container(
                    height: 100, width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(getSize(context)/22),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CategoryAllShimmer extends StatelessWidget {
  const CategoryAllShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Padding(
        padding:  EdgeInsets.only(right: getSize(context)/30),
        child: Shimmer(
          duration: const Duration(seconds: 2),
          // enabled: categoryController.categoryList == null,
          child: Column(children: [
            Container(
              height: 50, width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(getSize(context)/22,
              )),
            ),
            const SizedBox(height: 5),
            Container(height: 10, width: 50, color: Colors.grey[300]),
          ]),
        ),
      ),
    );
  }
}

