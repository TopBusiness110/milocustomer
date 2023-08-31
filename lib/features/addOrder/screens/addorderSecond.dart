import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milocustomer/core/utils/assets_manager.dart';
import 'package:milocustomer/core/utils/getSize.dart';
import 'package:milocustomer/core/widgets/customtextfield.dart';
import 'package:milocustomer/core/utils/app_colors.dart';



class AddOrderSecond extends StatefulWidget {
  const AddOrderSecond({Key? key}) : super(key: key);

  @override
  State<AddOrderSecond> createState() => _AddOrderSecondState();
}

class _AddOrderSecondState extends State<AddOrderSecond> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[200],

      body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           children: [

           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Expanded(child: Text('Event Type:'.tr(), style: TextStyle(fontSize: getSize(context)/22))),
               Expanded(child: Text('Event Date:'.tr(), style:TextStyle(fontSize: getSize(context)/22))),

             ],
           ),
           const SizedBox(height: 10,),

           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,

             children: [
               Expanded(
                 child: Container(


                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(getSize(context)/22),
                       color: AppColors.white,
                       border: Border.all(color:  Color(0xFFA9A9A9), width: 0.3)
                   ),
                   child: CustomTextField(


                     inputType: TextInputType.streetAddress,

                     showBorder: false,
                   ),
                 ),
               ),
               SizedBox(width: 10,),
               Expanded(
                 child: Container(
                   height: 55,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(getSize(context)/22),
                       color: AppColors.white,
                       border: Border.all(color:  Color(0xFFA9A9A9), width: 0.3)
                   ),
                   child: Row(
                     children: [
                       Expanded(child: Text('', style:TextStyle(fontSize: getSize(context)/22))),
                       Icon(Icons.calendar_today_outlined),
                       SizedBox(width: 10,),
                     ],
                   ),
                 ),
               ),
             ],
           ),
           const SizedBox(height: 20,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Expanded(child: Text('Event Time:'.tr(), style: TextStyle(fontSize: getSize(context)/24))),
               Expanded(child: Text('Budget (optional):'.tr(), style: TextStyle(fontSize: getSize(context)/24))),

             ],
           ),
           const SizedBox(height: 10,),

           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,

             children: [
               Expanded(
                 child: Container(
                   height: 55,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(getSize(context)/22),
                       color: AppColors.white,
                       border: Border.all(color:  Color(0xFFA9A9A9), width: 0.3)
                   ),
                   child: Row(
                     children: [
                       Expanded(child: Text('', style: TextStyle(fontSize:getSize(context)/24))),
                       Icon(Icons.access_time_filled),
                       SizedBox(width: 10,),
                     ],
                   ),
                 ),
               ),
               SizedBox(width: 10,),
               Expanded(
                 child: Container(
                   height: 55,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(getSize(context)/22),
                       color: AppColors.white,
                       border: Border.all(color:  Color(0xFFA9A9A9), width: 0.3)
                   ),
                   child: Row(
                     children: [
                       Expanded(child:
                       CustomTextField(


                         inputType: TextInputType.streetAddress,

                         showBorder: false,
                       )),
                 Image.asset(ImageAssets.dolar,
                     height: 16, width: 16),
                       SizedBox(width: 10,),
                     ],
                   ),
                 ),
               ),
             ],
           ),
           const SizedBox(height: 20,),
           Text('Venue Address:'.tr(), style: TextStyle(fontSize: getSize(context)/22)),
             const SizedBox(height: 10,),
           Container(
             height: 55,
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(getSize(context)/22),
                 color: AppColors.white,
                 border: Border.all(color:  Color(0xFFA9A9A9), width: 0.3)
             ),
             child: Row(
               children: [
                 Expanded(child:
                 CustomTextField(


                   inputType: TextInputType.streetAddress,

                   showBorder: false,
                 )),
                 Image.asset(ImageAssets.address1,
                     height: 16, width: 16),
                 SizedBox(width: 10,),
               ],
             ),
           ),
           const SizedBox(height: 20,),
             const SizedBox(height: 20,),
             Text('Additional Requests:'.tr(), style: TextStyle(fontSize: getSize(context)/22)),
             const SizedBox(height: 10,),
             Container(
               height: 250,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(getSize(context)/22),
                   color: AppColors.white,
                   border: Border.all(color:  Color(0xFFA9A9A9), width: 0.3)
               ),
               child:
               CustomTextField(


                 inputType: TextInputType.streetAddress,

                 showBorder: false,
                 maxLines: 10,
               ),
             ),
             const SizedBox(height: 20,),

         ],),

       ),
     ),
    );
  }
}
