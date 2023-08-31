import 'package:country_code_picker/country_code.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milocustomer/core/utils/app_colors.dart';
import 'package:milocustomer/core/utils/assets_manager.dart';
import 'package:milocustomer/core/utils/getSize.dart';
import 'package:milocustomer/core/widgets/custom_button.dart';
import 'package:milocustomer/core/widgets/customtextfield.dart';
import 'package:milocustomer/features/signup/cubit/signupcubit.dart';
import 'package:milocustomer/features/signup/cubit/signupstate.dart';
import 'package:milocustomer/features/signup/widget/condition_check_box.dart';
import 'package:milocustomer/features/signup/widget/pass_view.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {

  String? _countryDialCode;

  @override
  void initState() {
    super.initState();

    // _countryDialCode = context.read<SignUpCubit>().CountryCode.fromCountryCode(Get.find<SplashController>().configModel!.country!).dialCode;
    // if(Get.find<AuthController>().showPassView){
    //   Get.find<AuthController>().showHidePass(isUpdate: false);
    // }
  }

  @override
  Widget build(BuildContext context) {
    SignUpCubit cubit=context.read<SignUpCubit>();
    return BlocBuilder<SignUpCubit, SignUpState>(
  builder: (context, state) {
    return cubit.configModel!=null?
     Scaffold(
      backgroundColor:Colors.white ,
      body: SafeArea(child: Scrollbar(
        child: Center(
          child: Container(
            width: getSize(context) > 700 ? 700 : getSize(context),
            padding: getSize(context) > 700 ? const EdgeInsets.all(40) :
            EdgeInsets.all(getSize(context)/22),
            decoration: getSize(context) > 700 ? BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(getSize(context) /22),
            ) : null,
            child:  BlocBuilder<SignUpCubit, SignUpState>(
  builder: (context, state) {
    return SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

       const SizedBox(),

            Image.asset(ImageAssets.logo, width: 100),
             SizedBox(height: getSize(context)/22),
            //    Image.asset(Images.logoName, width: 100),
             SizedBox(height: getSize(context)/22),

            Align(
              alignment: Alignment.topLeft,
              child: Text('sign_up'.tr(),
                style: TextStyle(fontSize: getSize(context)*0.022, color: AppColors.black),
            )),
              SizedBox(height:getSize(context)/22),

            Row(children: [
              Expanded(
                child: CustomTextField(
                  titleText: 'first_name'.tr(),
                  hintText: 'ex_jhon'.tr(),
                  controller: cubit.firstNameController,
                  focusNode: cubit.firstNameFocus,
                  nextFocus: cubit.lastNameFocus,
                  inputType: TextInputType.name,
                  capitalization: TextCapitalization.words,
                  prefixIcon: Icons.person,
                 // showTitle: ResponsiveHelper.isDesktop(context),
                ),
              ),
              SizedBox(width: getSize(context)/22),

              Expanded(
                child: CustomTextField(
                  titleText: 'last_name'.tr(),
                  hintText: 'ex_doe'.tr(),
                  controller: cubit.lastNameController,
                  focusNode: cubit.lastNameFocus,
               //   nextFocus: ResponsiveHelper.isDesktop(context) ? _emailFocus : _phoneFocus,
                  inputType: TextInputType.name,
                  capitalization: TextCapitalization.words,
                  prefixIcon: Icons.person,
                 // showTitle: ResponsiveHelper.isDesktop(context),
                ),
              )
            ]),
             SizedBox(height:getSize(context)/22),

            Row(children: [
              const SizedBox(),
              SizedBox(width: 0),

              Expanded(
                child: CustomTextField(
                  titleText: 'enter_phone_number'.tr(),
                  controller: cubit.phoneController,
                  focusNode: cubit.phoneFocus,
              //    nextFocus: ResponsiveHelper.isDesktop(context) ? _passwordFocus : _emailFocus,
                  inputType: TextInputType.phone,
                  isPhone: true,
                //  showTitle: ResponsiveHelper.isDesktop(context),
                  onCountryChanged: (CountryCode countryCode) {
                    _countryDialCode = countryCode.dialCode;
                  },
                  countryDialCode: _countryDialCode != null ?
                  CountryCode.fromCountryCode
                    (cubit.configModel!.country!).code
                      : cubit.locale.countryCode,
                ),
              ),

            ]),
             SizedBox(height: getSize(context)/22),

          CustomTextField(
              titleText: 'email'.tr(),
              hintText: 'enter_email'.tr(),
              controller: cubit.emailController,
              focusNode: cubit.emailFocus,
              nextFocus: cubit.passwordFocus,
              inputType: TextInputType.emailAddress,
              prefixIcon: Icons.mail_outline_rounded,
              divider: false,
            ) ,
            SizedBox(height: getSize(context)/10),

            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: Column(children: [
                  CustomTextField(
                    titleText: 'password'.tr(),
                    hintText: 'password'.tr(),
                    controller: cubit.passwordController,
                    focusNode: cubit.passwordFocus,
                    nextFocus: cubit.confirmPasswordFocus,
                    inputType: TextInputType.visiblePassword,
                    prefixIcon: Icons.lock,
                    isPassword: true,
                    onChanged: (value){
                      if(value != null && value.isNotEmpty){
                        if(!cubit.showPassView){
                          cubit.showHidePass();
                        }
                        cubit.validPassCheck(value);
                      }else{
                        if(cubit.showPassView){
                          cubit.showHidePass();
                        }
                      }
                    },
                  ),

                  cubit.showPassView ? const PassView() : const SizedBox(),
                ]),
              ),
              SizedBox(width:  0),

              const SizedBox()

            ]),
             SizedBox(height:getSize(context)/10 ),

          CustomTextField(
              titleText: 'confirm_password'.tr(),
              hintText: 'confirm_password'.tr(),
              controller: cubit.confirmPasswordController,
              focusNode: cubit.confirmPasswordFocus,
              nextFocus:cubit.configModel!.refEarningStatus == 1 ?  cubit.referCodeFocus : null,
              inputAction: cubit.configModel!.refEarningStatus == 1 ? TextInputAction.next : TextInputAction.done,
              inputType: TextInputType.visiblePassword,
              prefixIcon: Icons.lock,
              isPassword: true,
              onSubmit: (text) => null,
            ) ,
            SizedBox(height: getSize(context)/22),


            (cubit.configModel!.refEarningStatus == 1 ) ? CustomTextField(
              hintText: 'refer_code'.tr(),
              titleText: 'refer_code'.tr(),
              controller: cubit.referCodeController,
              focusNode:  cubit.referCodeFocus,
              inputAction: TextInputAction.done,
              inputType: TextInputType.text,
              capitalization: TextCapitalization.words,
              // prefixIcon: Images.referCode,
              prefixImage : ImageAssets.referCode,
              divider: false,
              prefixSize: 14,
            ) : const SizedBox(),
             SizedBox(height: getSize(context)/22),

            ConditionCheckBox(authController: cubit, fromSignUp : true),
             SizedBox(height: getSize(context)/10),

            CustomButton(
              borderRadius:getSize(context)/22,
              text: 'sign_up'.tr(),
              onClick:() {

              }, color: AppColors.primary,
            ),
             SizedBox(height: getSize(context)/22),

            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('already_have_account'.tr(), style: TextStyle(color: AppColors.hint)),

              InkWell(
                onTap: () {
                  // if(ResponsiveHelper.isDesktop(context)){
                  //   Get.back();
                  //   Get.dialog(const SignInScreen(exitFromApp: false, backFromThis: false));
                  // }else{
                  //   Get.toNamed(RouteHelper.getSignInRoute(RouteHelper.signUp));
                  // }
                },
                child: Padding(
                  padding:  EdgeInsets.all(getSize(context)/22),
                  child: Text('sign_in'.tr(),
                      style: TextStyle(color: AppColors.primary)),
                ),
              ),
            ]),

            const SizedBox(height: 30),

            // SocialLoginWidget(),

            // const GuestButton(),

          ]),
        );
  },
)),
          ),
        ),
      )
    ):
     Container();
  },
);
  }

  // void _register(AuthController authController, String countryCode) async {
  //   String firstName = _firstNameController.text.trim();
  //   String lastName = _lastNameController.text.trim();
  //   String email = _emailController.text.trim();
  //   String number = _phoneController.text.trim();
  //   String password = _passwordController.text.trim();
  //   String confirmPassword = _confirmPasswordController.text.trim();
  //   String referCode = _referCodeController.text.trim();
  //
  //   String numberWithCountryCode = countryCode+number;
  //   PhoneValid phoneValid = await CustomValidator.isPhoneValid(numberWithCountryCode);
  //   numberWithCountryCode = phoneValid.phone;
  //
  //   if (firstName.isEmpty) {
  //     showCustomSnackBar('enter_your_first_name'.tr);
  //   }else if (lastName.isEmpty) {
  //     showCustomSnackBar('enter_your_last_name'.tr);
  //   }else if (email.isEmpty) {
  //     showCustomSnackBar('enter_email_address'.tr);
  //   }else if (!GetUtils.isEmail(email)) {
  //     showCustomSnackBar('enter_a_valid_email_address'.tr);
  //   }else if (number.isEmpty) {
  //     showCustomSnackBar('enter_phone_number'.tr);
  //   }else if (!phoneValid.isValid) {
  //     showCustomSnackBar('invalid_phone_number'.tr);
  //   }else if (password.isEmpty) {
  //     showCustomSnackBar('enter_password'.tr);
  //   }else if (password.length < 6) {
  //     showCustomSnackBar('password_should_be'.tr);
  //   }else if (password != confirmPassword) {
  //     showCustomSnackBar('confirm_password_does_not_matched'.tr);
  //   } else if (referCode.isNotEmpty && referCode.length != 10) {
  //     showCustomSnackBar('invalid_refer_code'.tr);
  //   } else {
  //     SignUpBody signUpBody = SignUpBody(
  //       fName: firstName, lName: lastName, email: email, phone: numberWithCountryCode, password: password,
  //       refCode: referCode,
  //     );
  //     authController.registration(signUpBody).then((status) async {
  //       if (status.isSuccess) {
  //         if(Get.find<SplashController>().configModel!.customerVerification!) {
  //           List<int> encoded = utf8.encode(password);
  //           String data = base64Encode(encoded);
  //           Get.toNamed(RouteHelper.getVerificationRoute(numberWithCountryCode, status.message, RouteHelper.signUp, data));
  //         }else {
  //           Get.find<LocationController>().navigateToLocationScreen(RouteHelper.signUp);
  //           // Get.toNamed(RouteHelper.getAccessLocationRoute(RouteHelper.signUp));
  //         }
  //       }else {
  //         showCustomSnackBar(status.message);
  //       }
  //     });
  //   }
  // }
}
