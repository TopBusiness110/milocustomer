import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:milocustomer/core/utils/app_colors.dart';
import 'package:milocustomer/core/utils/getSize.dart';
import 'package:milocustomer/core/widgets/custom_button.dart';


import 'addorderFirst.dart';
import 'addorderSecond.dart';

class AddOrderMainScreen extends StatefulWidget {
  const AddOrderMainScreen({Key? key}) : super(key: key);

  @override
  State<AddOrderMainScreen> createState() => _AddOrderMainScreenState();
}

class _AddOrderMainScreenState extends State<AddOrderMainScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: Center(
          child: Text(
            'add_order'.tr(),
            style: TextStyle(
              color: Colors.lightBlue,
              fontSize: getSize(context)/24,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: [
              AddOrderFirst(),
              AddOrderSecond(),

            ],

          )),
          CustomButton(
          paddingHorizontal:20,
            // margin: EdgeInsets.all(8),

            onClick: () {
              if (_tabController!.index == 0) {
                _tabController!.animateTo(1);
              } else {
                _tabController!.animateTo(0);
              }
              setState(() {
                
              });
            },
            color: AppColors.primary,
            text: _tabController!.index == 0 ? 'next'.tr() : 'back'.tr(),
          ),
          SizedBox(height: 20),
          Visibility(
            visible: _tabController!.index==1,
            child: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border:
                  Border.all(color: AppColors.primary)),
              child: CustomButton(
                color: Colors.white,
                textcolor:AppColors.primary,
                onClick: () {

                //  Get.toNamed(RouteHelper.getInitial1Route());

                },
                borderRadius:20,

               // paddingHorizontal:MediaQuery.of(context).size.width,
                text: 'confirmation'.tr(),
              ),
            ),
          ),
          SizedBox(height: 20),

        ],
      ),
    );
  }
}
