import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milocustomer/core/utils/app_colors.dart';
import 'package:milocustomer/core/utils/getSize.dart';
import 'package:milocustomer/core/widgets/custom_dropdown.dart';
import 'package:milocustomer/core/widgets/customtextfield.dart';

class AddOrderFirst extends StatefulWidget {
  const AddOrderFirst({Key? key}) : super(key: key);

  @override
  State<AddOrderFirst> createState() => _AddOrderFirstState();
}

class _AddOrderFirstState extends State<AddOrderFirst> {
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
              const SizedBox(height: 10,),
              Text('Type of Catering:'.tr, style:TextStyle(fontSize:getSize(context)/22)),
               SizedBox(height: getSize(context)/22),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(getSize(context)/22),
                    color: AppColors.white,
                    border: Border.all(color:  Color(0xFFA9A9A9), width: 0.3)
                ),
                child: CustomDropdown<int>(
                  onChange: (int? value, int index) {
                //    authController.setDMTypeIndex(index, true);
                  },
                  dropdownButtonStyle:  DropdownButtonStyle(
                    height: 45,
                    padding:  EdgeInsets.symmetric(
                      vertical: getSize(context)/22,
                      horizontal:getSize(context)/22,
                    ),
                    primary:  Color(0xFFA9A9A9),

                  ),
                  dropdownStyle: DropdownStyle(
                    elevation: 10,

                    borderRadius: BorderRadius.circular(getSize(context)/22),
                    padding:  EdgeInsets.all(getSize(context)/22),
                  ),
                  items: [],
                  child: Text(''.tr),
                ),
              ),
              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Text('Number of Guests:'.tr, style: TextStyle(fontSize: getSize(context)/22))),
                  Expanded(child: Text('Service Type:'.tr, style: TextStyle(fontSize: getSize(context)/22))),

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
                      child: CustomDropdown<int>(
                        onChange: (int? value, int index) {
                          //    authController.setDMTypeIndex(index, true);
                        },
                        dropdownButtonStyle:  DropdownButtonStyle(
                          height: 45,
                          padding:  EdgeInsets.symmetric(
                            vertical: getSize(context)/22,
                            horizontal: getSize(context)/22,
                          ),
                          primary:  Color(0xFFA9A9A9),

                        ),
                        dropdownStyle: DropdownStyle(
                          elevation: 10,

                          borderRadius: BorderRadius.circular(getSize(context)/22),
                          padding:  EdgeInsets.all(getSize(context)/22),
                        ),
                        items: [],
                        child: Text(''.tr),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Text('Preferred Cuisine:'.tr, style: TextStyle(fontSize: getSize(context)/22)),
               SizedBox(height: getSize(context)/22),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(getSize(context)/22),
                    color: AppColors.white,
                    border: Border.all(color:  Color(0xFFA9A9A9), width: 0.3)
                ),
                child: CustomDropdown<int>(
                  onChange: (int? value, int index) {
                    //    authController.setDMTypeIndex(index, true);
                  },
                  dropdownButtonStyle:  DropdownButtonStyle(
                    height: 45,
                    padding:  EdgeInsets.symmetric(
                      vertical: getSize(context)/22,
                      horizontal: getSize(context)/22,
                    ),
                    primary:  Color(0xFFA9A9A9),

                  ),
                  dropdownStyle: DropdownStyle(
                    elevation: 10,

                    borderRadius: BorderRadius.circular(getSize(context)/22),
                    padding:  EdgeInsets.all(getSize(context)/22),
                  ),
                  items: [],
                  child: Text(''.tr),
                ),
              ),
               SizedBox(height: 20,),
              Text('Occasion:'.tr, style: TextStyle(fontSize:getSize(context)/22)),
               SizedBox(height: getSize(context)/22),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(getSize(context)/22),
                    color: AppColors.white,
                    border: Border.all(color:  Color(0xFFA9A9A9), width: 0.3)
                ),
                child: CustomDropdown<int>(
                  onChange: (int? value, int index) {
                    //    authController.setDMTypeIndex(index, true);
                  },
                  dropdownButtonStyle:  DropdownButtonStyle(
                    height: 45,
                    padding:  EdgeInsets.symmetric(
                      vertical: getSize(context)/22,
                      horizontal: getSize(context)/22,
                    ),
                    primary:  Color(0xFFA9A9A9),

                  ),
                  dropdownStyle: DropdownStyle(
                    elevation: 10,

                    borderRadius: BorderRadius.circular(getSize(context)/22),
                    padding:  EdgeInsets.all(getSize(context)/22),
                  ),
                  items: [],
                  child: Text(''.tr),
                ),
              ),
              const SizedBox(height: 20,),
              Text('Special Dietary Requirements:'.tr, style: TextStyle(fontSize: getSize(context)/24)),
               SizedBox(height: getSize(context)/22),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(getSize(context)/22),
                    color: AppColors.white,
                    border: Border.all(color:  Color(0xFFA9A9A9), width: 0.3)
                ),
                child:  CustomTextField(


                  inputType: TextInputType.streetAddress,

                  showBorder: false,
                ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
