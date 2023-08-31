
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:milocustomer/core/utils/app_colors.dart';
import 'package:milocustomer/core/utils/getSize.dart';
import 'package:milocustomer/core/widgets/custom_button.dart';
import 'package:milocustomer/core/widgets/custom_image.dart';
import 'package:milocustomer/core/widgets/search_field.dart';



class RestaurantOffers extends StatefulWidget {
  const RestaurantOffers({
    Key? key,
  }) : super(key: key);

  @override
  State<RestaurantOffers> createState() => _RestaurantOffersState();
}

class _RestaurantOffersState extends State<RestaurantOffers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.yellow),
                  child: Center(
                      child: Icon(
                    Icons.arrow_back_ios,
                    size: 10,
                  )),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: SearchField(
                    suffixIcon: Icons.search,
                    controller: TextEditingController(),
                    hint: "Restaurant ' Catering  ' Service",
                    iconPressed: () {},

                    // prefixIcon: Icons.abc_outlined,
                    //   controller: _searchController,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        ClipOval(
                          //  borderRadius: BorderRadius.circular(30),
                          child: CustomImage(
                            image:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQs-QgBlLOHMcF27Gg6DWSG0PDN2EUwzV9D0A&usqp=CAU",
                            height: 55,
                            width: 55,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Column(

                          children: [
                            Text('Chef Joseph', style: TextStyle(fontSize: getSize(context)/32)),
                           SizedBox(height: 20,),
                            CustomButton(
                              borderRadius: 20,

                              text: 'start chat'.tr(),
                            paddingHorizontal: 10,
                            color: Colors.white,
                            textcolor: AppColors.primary,
                            onClick: (){
                              // Get.toNamed(
                              //     RouteHelper.getChatRoute(
                              //   notificationBody: NotificationBody(
                              //     type:'',
                              //     notificationType: NotificationType.message,
                              //     adminId:  null,
                              //     restaurantId:  null,
                              //     deliverymanId:  null,
                              //   ),
                              //   conversationID: 0,
                              //   index: index,
                              // ));
                            },
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                       // Spacer(),
                        Text('100\$', style: TextStyle(fontSize:getSize(context)/32,color: AppColors.grey1))
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
