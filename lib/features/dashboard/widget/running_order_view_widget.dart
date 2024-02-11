// import 'package:milocustomer/controller/order_controller.dart';
// import 'package:milocustomer/core/utils/app_colors.dart';
// import 'package:milocustomer/data/model/response/order_model.dart';
// import 'package:milocustomer/helper/route_helper.dart';
// import 'package:milocustomer/util/app_constants.dart';
// import 'package:milocustomer/util/dimensions.dart';
// import 'package:milocustomer/util/images.dart';
// import 'package:milocustomer/util/styles.dart';
// import 'package:milocustomer/view/screens/order/order_details_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class RunningOrderViewWidget extends StatelessWidget {
//   final List<OrderModel> reversOrder;
//   final Function() onMoreClick;
//   const RunningOrderViewWidget(
//       {Key? key, required this.reversOrder, required this.onMoreClick})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<OrderController>(builder: (orderController) {
//       return Container(
//         decoration: BoxDecoration(
//             color: AppColors.white,
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(Dimensions.paddingSizeExtraLarge),
//               topRight: Radius.circular(Dimensions.paddingSizeExtraLarge),
//             ),
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.grey[200]!,
//                   offset: const Offset(0, -5),
//                   blurRadius: 10)
//             ]),
//         child: Column(children: [
//           Center(
//             child: Container(
//               margin: const EdgeInsets.only(top: Dimensions.paddingSizeDefault),
//               height: 3,
//               width: 40,
//               decoration: BoxDecoration(
//                   color: AppColors.highlightColor,
//                   borderRadius:
//                       BorderRadius.circular(Dimensions.paddingSizeExtraSmall)),
//             ),
//           ),
//           ListView.builder(
//               itemCount: reversOrder.length,
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               padding: EdgeInsets.zero,
//               itemBuilder: (context, index) {
//                 bool isFirstOrder = index == 0;

//                 String? orderStatus = reversOrder[index].orderStatus ?? '';
//                 int status = 0;

//                 if (orderStatus == AppConstants.pending) {
//                   status = 1;
//                 } else if (orderStatus == AppConstants.accepted ||
//                     orderStatus == AppConstants.processing ||
//                     orderStatus == AppConstants.confirmed) {
//                   status = 2;
//                 } else if (orderStatus == AppConstants.handover ||
//                     orderStatus == AppConstants.pickedUp) {
//                   status = 3;
//                 }

//                 return InkWell(
//                   onTap: () async {
//                     await Get.toNamed(
//                       RouteHelper.getOrderDetailsRoute(reversOrder[index].id),
//                       arguments: OrderDetailsScreen(
//                         orderId: reversOrder[index].id,
//                         orderModel: reversOrder[index],
//                       ),
//                     );
//                     if (orderController.showBottomSheet) {
//                       orderController.showRunningOrders();
//                     }
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.only(
//                         bottom: Dimensions.paddingSizeExtraSmall,
//                         top: getSize(context) / 22),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: Dimensions.paddingSizeDefault),
//                       child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Center(
//                               child: SizedBox(
//                                 height: orderStatus == AppConstants.pending
//                                     ? 50
//                                     : 60,
//                                 width: orderStatus == AppConstants.pending
//                                     ? 50
//                                     : 60,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Image.asset(
//                                       status == 2
//                                           ? orderStatus ==
//                                                       AppConstants.confirmed ||
//                                                   orderStatus ==
//                                                       AppConstants.accepted
//                                               ? Images.processingGif
//                                               : Images.cookingGif
//                                           : status == 3
//                                               ? orderStatus ==
//                                                       AppConstants.handover
//                                                   ? Images.handoverGif
//                                                   : Images.onTheWayGif
//                                               : Images.pendingGif,
//                                       height: 60,
//                                       width: 60,
//                                       fit: BoxFit.fill),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                                 width:
//                                     isFirstOrder ? 0 : getSize(context) / 22),
//                             Expanded(
//                               child: Column(
//                                   mainAxisAlignment: isFirstOrder
//                                       ? MainAxisAlignment.center
//                                       : MainAxisAlignment.start,
//                                   crossAxisAlignment: isFirstOrder
//                                       ? CrossAxisAlignment.center
//                                       : CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                         mainAxisAlignment: isFirstOrder
//                                             ? MainAxisAlignment.center
//                                             : MainAxisAlignment.start,
//                                         children: [
//                                           Text('${'your_order_is'.tr} ',
//                                               style: TextStyle(
//                                                   fontSize: Dimensions
//                                                       .fontSizeDefault)),
//                                           Text(
//                                               reversOrder[index]
//                                                   .orderStatus!
//                                                   .tr,
//                                               style: TextStyle(
//                                                   fontSize: Dimensions
//                                                       .fontSizeDefault,
//                                                   color: AppColors.primary)),
//                                         ]),
//                                     const SizedBox(
//                                         height:
//                                             Dimensions.paddingSizeExtraSmall),
//                                     Text(
//                                       '${'order'.tr} #${reversOrder[index].id}',
//                                       style: robotoRegular.copyWith(
//                                           fontSize: Dimensions.fontSizeSmall),
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                     isFirstOrder
//                                         ? SizedBox(
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                       horizontal: Dimensions
//                                                           .paddingSizeDefault,
//                                                       vertical:
//                                                           getSize(context) /
//                                                               22),
//                                               child: Row(children: [
//                                                 Expanded(
//                                                     child: trackView(context,
//                                                         status: status >= 1
//                                                             ? true
//                                                             : false)),
//                                                 const SizedBox(
//                                                     width: Dimensions
//                                                         .paddingSizeExtraSmall),
//                                                 Expanded(
//                                                     child: trackView(context,
//                                                         status: status >= 2
//                                                             ? true
//                                                             : false)),
//                                                 const SizedBox(
//                                                     width: Dimensions
//                                                         .paddingSizeExtraSmall),
//                                                 Expanded(
//                                                     child: trackView(context,
//                                                         status: status >= 3
//                                                             ? true
//                                                             : false)),
//                                                 const SizedBox(
//                                                     width: Dimensions
//                                                         .paddingSizeExtraSmall),
//                                                 Expanded(
//                                                     child: trackView(context,
//                                                         status: status >= 4
//                                                             ? true
//                                                             : false)),
//                                               ]),
//                                             ),
//                                           )
//                                         : const SizedBox()
//                                   ]),
//                             ),
//                             Container(
//                               padding: const EdgeInsets.all(
//                                   Dimensions.paddingSizeDefault),
//                               decoration: BoxDecoration(
//                                   color: AppColors.primary.withOpacity(0.1),
//                                   shape: BoxShape.circle),
//                               child: isFirstOrder
//                                   ? !(reversOrder.length < 2)
//                                       ? InkWell(
//                                           onTap: onMoreClick,
//                                           child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Text(
//                                                     '+${reversOrder.length - 1}',
//                                                     style: TextStyle(
//                                                         fontSize:
//                                                             getSize(context) /
//                                                                 24,
//                                                         color:
//                                                             AppColors.primary)),
//                                                 Text('more'.tr,
//                                                     style: TextStyle(
//                                                         fontSize: Dimensions
//                                                             .fontSizeExtraSmall,
//                                                         color:
//                                                             AppColors.primary)),
//                                               ]),
//                                         )
//                                       : Icon(Icons.arrow_forward,
//                                           size: 18, color: AppColors.primary)
//                                   : Icon(Icons.arrow_forward,
//                                       size: 18, color: AppColors.primary),
//                             ),
//                           ]),
//                     ),
//                   ),
//                 );
//               }),
//         ]),
//       );
//     });
//   }

//   Widget trackView(BuildContext context, {required bool status}) {
//     return Container(
//         height: 5,
//         decoration: BoxDecoration(
//             color: status
//                 ? AppColors.primary
//                 : AppColors.disabledColor.withOpacity(0.5),
//             borderRadius: BorderRadius.circular(Dimensions.radiusDefault)));
//   }
// }
