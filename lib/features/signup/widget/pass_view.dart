import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:milocustomer/core/utils/getsize.dart';
import 'package:milocustomer/features/signup/cubit/signupcubit.dart';
import 'package:milocustomer/features/signup/cubit/signupstate.dart';

class PassView extends StatelessWidget {
  const PassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpCubit authController=context.read<SignUpCubit>();
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: getSize(context) / 22),
          child: Wrap(children: [

            view('8_or_more_character'.tr(), authController.lengthCheck,context),

            view('1_number'.tr(), authController.numberCheck,context),

            view('1_upper_case'.tr(), authController.uppercaseCheck,context),

            view('1_lower_case'.tr(), authController.lowercaseCheck,context),

            view('1_special_character'.tr(), authController.spatialCheck,context),

          ]),
        );
      },
    );
  }

  Widget view(String title, bool done,BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: getSize(context) / 22),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(done ? Icons.check : Icons.clear,
            color: done ? Colors.green : Colors.red, size: 12),
        Text(title, style: TextStyle(
            color: done ? Colors.green : Colors.red, fontSize: 12))
      ]),
    );
  }
}
