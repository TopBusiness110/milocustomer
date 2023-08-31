import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:milocustomer/config/routes/app_routes.dart';
import 'package:milocustomer/core/utils/app_colors.dart';
import 'package:milocustomer/core/utils/getsize.dart';

class GuestButton extends StatelessWidget {
  const GuestButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: const Size(1, 40),
      ),
      onPressed: () {
        Navigator.pushReplacementNamed(context, Routes.homeScreen);
      },
      child: RichText(text: TextSpan(children: [
        TextSpan(text: '${'continue_as'.tr()} ',  style:TextStyle(fontSize: getSize(context)*0.022, color: AppColors.hint)),
        TextSpan(text: 'guest'.tr(),  style:TextStyle(fontSize: getSize(context)*0.022, color: AppColors.black)),
      ])),
    );
  }
}
