
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milocustomer/core/utils/app_colors.dart';
import 'package:milocustomer/core/utils/getsize.dart';
import 'package:milocustomer/features/login/cubit/login_cubit.dart';
import 'package:milocustomer/features/signup/cubit/signupcubit.dart';

class ConditionCheckBox extends StatelessWidget {
  final SignUpCubit authController;
  final bool fromSignUp;
  const ConditionCheckBox({Key? key, required this.authController,  this.fromSignUp = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: fromSignUp ? MainAxisAlignment.start : MainAxisAlignment.center, children: [

      fromSignUp ? Checkbox(
        activeColor: AppColors.primary,
        value: authController.acceptTerms,
        onChanged: (bool? isChecked) => authController.toggleTerms(),
      ) : const SizedBox(),

      fromSignUp ? const SizedBox() : Text( '* ', style:TextStyle(fontSize: getSize(context)*0.022, color: AppColors.red)),
      Text('by_login_i_agree_with_all_the'.tr,  style:TextStyle(fontSize: getSize(context)*0.022, color: AppColors.hint)),

      Expanded(
        child: InkWell(
          onTap: () => {},
          child: Padding(
            padding:  EdgeInsets.all(getSize(context)/22),
            child: Text('terms_conditions'.tr, style:TextStyle(fontSize: getSize(context)*0.022, color: AppColors.primary) ),
          ),
        ),
      )
    ]);
  }
}
