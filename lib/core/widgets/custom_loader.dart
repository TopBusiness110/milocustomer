import 'package:flutter/material.dart';
import 'package:milocustomer/core/utils/app_colors.dart';
import 'package:milocustomer/core/utils/getSize.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      height: 100, width: 100,
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(getSize(context)/22)),
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    ));
  }
}
