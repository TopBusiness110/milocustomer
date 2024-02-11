// import 'package:milocustomer/controller/location_controller.dart';
// import 'package:milocustomer/core/utils/app_colors.dart';
// import 'package:milocustomer/data/model/response/address_model.dart';
// import 'package:milocustomer/data/model/response/zone_response_model.dart';
// import 'package:milocustomer/helper/responsive_helper.dart';
// import 'package:milocustomer/helper/route_helper.dart';
// import 'package:milocustomer/util/dimensions.dart';
// import 'package:milocustomer/util/images.dart';
// import 'package:milocustomer/util/styles.dart';
// import 'package:milocustomer/view/base/custom_loader.dart';
// import 'package:milocustomer/view/base/custom_snackbar.dart';
// import 'package:milocustomer/view/screens/address/widget/address_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AddressBottomSheet extends StatelessWidget {
//   const AddressBottomSheet({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(Dimensions.paddingSizeExtraLarge),
//           topRight: Radius.circular(Dimensions.paddingSizeExtraLarge),
//         ),
//       ),
//       child: GetBuilder<LocationController>(builder: (locationController) {
//         AddressModel? selectedAddress = locationController.getUserAddress();
//         return Column(mainAxisSize: MainAxisSize.min, children: [
//           Center(
//             child: Container(
//               margin: const EdgeInsets.only(
//                   top: Dimensions.paddingSizeDefault,
//                   bottom: Dimensions.paddingSizeDefault),
//               height: 3,
//               width: 40,
//               decoration: BoxDecoration(
//                   color: AppColors.highlightColor,
//                   borderRadius:
//                       BorderRadius.circular(Dimensions.paddingSizeExtraSmall)),
//             ),
//           ),
//           Flexible(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(
//                   horizontal: getSize(context) / 22,
//                   vertical: getSize(context) / 22),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                         '${'hey_welcome_back'.tr}\n${'which_location_do_you_want_to_select'.tr}',
//                         style: TextStyle(fontSize: Dimensions.fontSizeDefault)),
//                     const SizedBox(height: getSize(context) / 22),
//                     locationController.addressList != null &&
//                             locationController.addressList!.isEmpty
//                         ? Column(children: [
//                             Image.asset(Images.noAddress, width: 150),
//                             Text(
//                               'you_dont_have_any_saved_address_yet'.tr,
//                               textAlign: TextAlign.center,
//                               style: robotoRegular.copyWith(
//                                   fontSize: Dimensions.fontSizeSmall,
//                                   color: AppColors.disabledColor),
//                             ),
//                           ])
//                         : const SizedBox(),
//                     locationController.addressList != null &&
//                             locationController.addressList!.isEmpty
//                         ? const SizedBox(height: getSize(context) / 22)
//                         : const SizedBox(),
//                     Align(
//                       alignment: locationController.addressList != null &&
//                               locationController.addressList!.isNotEmpty
//                           ? Alignment.centerLeft
//                           : Alignment.center,
//                       child: TextButton.icon(
//                         onPressed: () {
//                           Get.find<LocationController>()
//                               .checkPermission(() async {
//                             Get.dialog(const CustomLoader(),
//                                 barrierDismissible: false);
//                             AddressModel address =
//                                 await Get.find<LocationController>()
//                                     .getCurrentLocation(true);
//                             ZoneResponseModel response =
//                                 await locationController.getZone(
//                                     address.latitude, address.longitude, false);
//                             if (response.isSuccess) {
//                               locationController.saveAddressAndNavigate(
//                                 address,
//                                 false,
//                                 '',
//                                 false,
//                                 ResponsiveHelper.isDesktop(Get.context),
//                               );
//                             } else {
//                               Get.back();
//                               Get.toNamed(RouteHelper.getPickMapRoute(
//                                   RouteHelper.accessLocation, false));
//                               showCustomSnackBar(
//                                   'service_not_available_in_current_location'
//                                       .tr);
//                             }
//                           });
//                         },
//                         style: TextButton.styleFrom(
//                           backgroundColor:
//                               locationController.addressList != null &&
//                                       locationController.addressList!.isEmpty
//                                   ? AppColors.primary
//                                   : Colors.transparent,
//                         ),
//                         icon: Icon(Icons.my_location,
//                             color: locationController.addressList != null &&
//                                     locationController.addressList!.isEmpty
//                                 ? AppColors.white
//                                 : AppColors.primary),
//                         label: Text('use_current_location'.tr,
//                             style: robotoMedium.copyWith(
//                                 color: locationController.addressList != null &&
//                                         locationController.addressList!.isEmpty
//                                     ? AppColors.white
//                                     : AppColors.primary)),
//                       ),
//                     ),
//                     const SizedBox(height: getSize(context) / 22),
//                     locationController.addressList != null
//                         ? locationController.addressList!.isNotEmpty
//                             ? Container(
//                                 decoration: BoxDecoration(
//                                   color: AppColors.primary.withOpacity(0.05),
//                                   borderRadius: BorderRadius.circular(
//                                       Dimensions.radiusDefault),
//                                 ),
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: getSize(context) / 22,
//                                     vertical: getSize(context) / 22),
//                                 child: ListView.builder(
//                                   physics: const NeverScrollableScrollPhysics(),
//                                   shrinkWrap: true,
//                                   itemCount:
//                                       locationController.addressList!.length > 5
//                                           ? 5
//                                           : locationController
//                                               .addressList!.length,
//                                   itemBuilder: (context, index) {
//                                     bool selected = false;
//                                     if (selectedAddress!.address ==
//                                         locationController
//                                             .addressList![index].address) {
//                                       selected = true;
//                                     }
//                                     return Center(
//                                         child: SizedBox(
//                                             width: 700,
//                                             child: AddressWidget(
//                                               address: locationController
//                                                   .addressList![index],
//                                               fromAddress: false,
//                                               isSelected: selected,
//                                               fromDashBoard: true,
//                                               onTap: () {
//                                                 Get.dialog(const CustomLoader(),
//                                                     barrierDismissible: false);
//                                                 AddressModel address =
//                                                     locationController
//                                                         .addressList![index];
//                                                 locationController
//                                                     .saveAddressAndNavigate(
//                                                   address,
//                                                   false,
//                                                   null,
//                                                   false,
//                                                   ResponsiveHelper.isDesktop(
//                                                       context),
//                                                 );
//                                               },
//                                             )));
//                                   },
//                                 ),
//                               )
//                             : const SizedBox()
//                         : const Center(child: CircularProgressIndicator()),
//                     SizedBox(
//                         height: locationController.addressList != null &&
//                                 locationController.addressList!.isEmpty
//                             ? 0
//                             : getSize(context) / 22),
//                     locationController.addressList != null &&
//                             locationController.addressList!.isNotEmpty
//                         ? TextButton.icon(
//                             onPressed: () => Get.toNamed(
//                                 RouteHelper.getAddAddressRoute(false, 0)),
//                             icon: const Icon(Icons.add_circle_outline_sharp),
//                             label: Text('add_new_address'.tr,
//                                 style: robotoMedium.copyWith(
//                                     color: AppColors.primary)),
//                           )
//                         : const SizedBox(),
//                   ]),
//             ),
//           ),
//         ]);
//       }),
//     );
//   }
// }
