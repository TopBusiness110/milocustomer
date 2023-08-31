
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:milocustomer/core/utils/app_colors.dart';
import 'package:milocustomer/core/utils/assets_manager.dart';
import 'package:milocustomer/core/utils/getsize.dart';
import 'package:milocustomer/features/login/cubit/login_cubit.dart';
import 'package:milocustomer/features/login/cubit/login_state.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = context.read<LoginCubit>();

    final GoogleSignIn googleSignIn = GoogleSignIn();
    return BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
    return cubit.configModel!=null&&cubit.configModel!.socialLogin!.isNotEmpty && (cubit.configModel!.socialLogin![0].status!
    ||cubit.configModel!.socialLogin![1].status!) ?
    Column(children: [

      Center(child: Text('social_login'.tr(),  style:TextStyle(fontSize: getSize(context)*0.022, color: AppColors.primary),
          )),
       SizedBox(height: 20),

      Row(mainAxisAlignment: MainAxisAlignment.center, children: [

        cubit.configModel!.socialLogin![0].status! ? InkWell(
          onTap: () async {
            GoogleSignInAccount googleAccount = (await googleSignIn.signIn())!;
            GoogleSignInAuthentication auth = await googleAccount.authentication;
            // Get.find<AuthController>().loginWithSocialMedia(SocialLogInBody(
            //   email: googleAccount.email, token: auth.idToken, uniqueId: googleAccount.id, medium: 'google',
            // ));
          },
          child: Container(
            height: 40,width: 40,
            padding:  EdgeInsets.all(getSize(context)/40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              boxShadow: [BoxShadow(color: Colors.grey[ 300]!, spreadRadius: 1, blurRadius: 5)],

            ),
            child: Image.asset(ImageAssets.google,fit: BoxFit.cover),
          ),
        ) : const SizedBox(),
        SizedBox(width: cubit.configModel!.socialLogin![0].status! ?
      getSize(context)/22: 0),

        cubit.configModel!.socialLogin![1].status! ? InkWell(
          onTap: () async{
            LoginResult result = await FacebookAuth.instance.login(permissions: ["public_profile", "email"]);
            if (result.status == LoginStatus.success) {
              Map userData = await FacebookAuth.instance.getUserData();
              // Get.find<AuthController>().loginWithSocialMedia(SocialLogInBody(
              //   email: userData['email'], token: result.accessToken!.token, uniqueId: result.accessToken!.userId, medium: 'facebook',
              // ));
            }

          },
          child: Container(
            height: 40, width: 40,
            padding:  EdgeInsets.all(getSize(context)/40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              boxShadow: [BoxShadow(color: Colors.grey[ 300]!, spreadRadius: 1, blurRadius: 5)],

            ),
            child: Image.asset(ImageAssets.facebook),
          ),
        ) : const SizedBox(),
         SizedBox(width:getSize(context)/22),

        cubit.configModel!.appleLogin!.isNotEmpty && cubit.configModel!.appleLogin![0].status!
        && !GetPlatform.isAndroid && !GetPlatform.isWeb ? InkWell(
          onTap: () async {
            final credential = await SignInWithApple.getAppleIDCredential(scopes: [
              AppleIDAuthorizationScopes.email,
              AppleIDAuthorizationScopes.fullName,
            ],
              // webAuthenticationOptions: WebAuthenticationOptions(
              //   clientId: cubit.configModel.appleLogin[0].clientId,
              //   redirectUri: Uri.parse('https://6ammart-web.6amtech.com/apple'),
              // ),
            );
            // Get.find<AuthController>().loginWithSocialMedia(SocialLogInBody(
            //   email: credential.email, token: credential.authorizationCode, uniqueId: credential.authorizationCode, medium: 'apple',
            // ));
          },
          child: Container(
            height: 40,
            width: 40,
            padding:  EdgeInsets.all(getSize(context)/22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Image.asset(ImageAssets.appleLogo),
          ),
        ) : const SizedBox(),

      ]),
       SizedBox(height: getSize(context)/22),

    ]) :
    const SizedBox();
  }

  );
}}
