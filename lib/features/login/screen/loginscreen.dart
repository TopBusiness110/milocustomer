import 'package:country_code_picker/country_code.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milocustomer/config/routes/app_routes.dart';
import 'package:milocustomer/core/utils/app_colors.dart';
import 'package:milocustomer/core/utils/assets_manager.dart';
import 'package:milocustomer/core/widgets/custom_button.dart';
import 'package:milocustomer/features/login/cubit/login_cubit.dart';
import 'package:milocustomer/features/login/cubit/login_state.dart';
import 'package:milocustomer/features/login/widget/condition_check_box.dart';
import 'package:milocustomer/features/login/widget/guest_button.dart';
import 'package:milocustomer/features/login/widget/social_login_widget.dart';

import '../../../core/utils/getsize.dart';
import '../../../core/widgets/customtextfield.dart';
import '../../../core/widgets/customloginstatusbutton.dart';
import '../../../core/widgets/loginappbar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode _phoneFocus = FocusNode();
    final FocusNode _passwordFocus = FocusNode();
    String? _countryDialCode;
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        LoginCubit cubit = context.read<LoginCubit>();
        return      WillPopScope(
          onWillPop: () async {
           return true;
          },
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: SafeArea(child: Scrollbar(
              child: Center(
                child: Container(
                  width: getSize(context) > 700 ? 500 :getSize(context),
                  padding:getSize(context) > 700 ? const EdgeInsets.all(50) :   EdgeInsets.all(getSize(context)/22),
                  margin:getSize(context) > 700 ? const EdgeInsets.all(50) : EdgeInsets.zero,
                  decoration:getSize(context) > 700 ? BoxDecoration(
                    color: AppColors.white, borderRadius: BorderRadius.circular(getSize(context)/22),
                  //  boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 700 : 300]!, blurRadius: 5, spreadRadius: 1)],
                  ) : null,
                  child:

                     Center(
                      child: SingleChildScrollView(
                        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

                          const SizedBox(height: 50,),

                          Image.asset(ImageAssets.logo, width: 100),
                           SizedBox(height:getSize(context)/22),
                          // Image.asset(Images.logoName, width: 100),
                          SizedBox(height:getSize(context)/10),

                          Align(
                            alignment: Alignment.topLeft,
                            child: Text('sign_in'.tr(),
                                style: TextStyle(fontSize: getSize(context)*0.022, color: AppColors.black)),
                          ),
                           SizedBox(height: getSize(context)/22),

                          CustomTextField(
                            titleText:'enter_phone_number'.tr(),
                            hintText: 'enter_phone_number'.tr(),
                            controller: cubit.phoneController,
                            focusNode: _phoneFocus,
                            nextFocus: _passwordFocus,
                            inputType: TextInputType.phone,
                            isPhone: true,
                            onCountryChanged: (CountryCode countryCode) {
                              _countryDialCode = countryCode.dialCode;
                            },
                            countryDialCode:
                            CountryCode.fromCountryCode(
                                cubit.configModel!=null&&
                                    cubit.configModel!.country!=null?
                                cubit.configModel!.country!:
                            "EG").code

                          ),
                            SizedBox(height: getSize(context)/22),

                          CustomTextField(
                            titleText:  'enter_your_password'.tr(),
                            hintText: 'enter_your_password'.tr(),
                            controller: cubit.passwprdController,
                            focusNode: _passwordFocus,
                            inputAction: TextInputAction.done,
                            inputType: TextInputType.visiblePassword,
                            prefixIcon: Icons.lock,
                            isPassword: true,
                           
                            onSubmit: (text) => 
                            null,
                          ),
                            SizedBox(height: getSize(context)/22),


                          Row(children: [
                            Expanded(
                              child: ListTile(
                                onTap: () => cubit.toggleRememberMe(),
                                leading: Checkbox(
                                  activeColor: AppColors.primary,
                                  value: cubit.isActiveRememberMe,
                                  onChanged: (bool? isChecked) => cubit.toggleRememberMe(),
                                ),
                                title: Text('remember_me'.tr()),
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                                horizontalTitleGap: 0,
                              ),
                            ),
                            TextButton(
                              onPressed: () => {

                              },
                              child: Text('${'forgot_password'.tr()}?',
                                  style:TextStyle(fontSize: getSize(context)*0.022, color: AppColors.hint)),
                            ),
                          ]),
                          SizedBox(height: getSize(context)/22),

                          ConditionCheckBox(authController: cubit),
                          SizedBox(height: getSize(context)/22),

                          CustomButton(

                            text: 'sign_in'.tr(),
                            onClick: () {

                            },
                            color: AppColors.primary,
                          ),
                            SizedBox(height: getSize(context)/22),

                          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Text('do_not_have_account'.tr(),
                          style:TextStyle(fontSize: getSize(context)*0.022, color: AppColors.hint)),

                            InkWell(
                              onTap: () {

                                  Navigator.pushNamed(context, Routes.signUp);
                                //  Get.toNamed(RouteHelper.getSignUpRoute());

                              },
                              child: Padding(
                                padding:  EdgeInsets.all(getSize(context)/22),
                                child: Text('sign_up'.tr(),
                                    style:TextStyle(fontSize: getSize(context)*0.022, color: AppColors.primary)),
                              ),
                            ),
                          ]),

                  SizedBox(height: getSize(context)/22),

                          const SocialLoginWidget(),

                          const GuestButton(),

                        ]),
                      ),
                    )
                 ,
                ),
              ),
            )),
          ),
        );

      },
    );
  }
}
