import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milocustomer/core/models/config_model.dart';
import 'package:milocustomer/core/utils/app_strings.dart';
import 'package:milocustomer/features/signup/cubit/signupstate.dart';
import 'package:milocustomer/core/remote/service.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.api) : super(InitSignUpState()){
    getconfig();
  }
  ServiceApi api;
  ConfigModel? configModel;
  bool showPassView = false;
  bool lengthCheck = false;
  bool numberCheck = false;
  bool uppercaseCheck = false;
  bool lowercaseCheck = false;
  bool spatialCheck = false;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController referCodeController = TextEditingController();
  Locale locale = Locale(AppStrings.languages[0].languageCode!, AppStrings.languages[0].countryCode);
  final FocusNode firstNameFocus = FocusNode();
  final FocusNode lastNameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();
  final FocusNode referCodeFocus = FocusNode();
  TextEditingController cityController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  bool acceptTerms=false;

  TextEditingController passwprdController = TextEditingController();
  TextEditingController confirmPasswprdController = TextEditingController();
  int currentUser = 0; //0 admin 1 driver  2  user
  getconfig() async {
    emit(ConfigLoading());
    final response = await api.getConfig();
    response.fold(
          (l) => emit(ConfigError()),
          (r) {
        configModel = r;

        emit(ConfigLoaded());
      },
    );
  }
  void toggleTerms() {
    acceptTerms = !acceptTerms;
    emit(UserState());

  }
  // toggleDriver(){
  //   currentUser = 1 ;
  //   emit(DriverState());
 // }

   toggleUserDriver(int index){
    if(index==1){
      currentUser = 1 ;
      emit(DriverState());
    }
    else{
      currentUser = 2 ;
      emit(UserState());
    }
    }
  // toggleUser(){
  //   currentUser = 2 ;
  //   emit(UserState());
  // }
  void showHidePass({bool isUpdate = true}){
    showPassView = ! showPassView;
   emit(ConfigLoaded());
  }
  void validPassCheck(String pass, {bool isUpdate = true}) {
   lengthCheck = false;
   numberCheck = false;
   uppercaseCheck = false;
   lowercaseCheck = false;
   spatialCheck = false;

    if(pass.length > 7){
     lengthCheck = true;
    }
    if(pass.contains(RegExp(r'[a-z]'))){
     lowercaseCheck = true;
    }
    if(pass.contains(RegExp(r'[A-Z]'))){
     uppercaseCheck = true;
    }
    if(pass.contains(RegExp(r'[ .!@#$&*~^%]'))){
     spatialCheck = true;
    }
    if(pass.contains(RegExp(r'[\d+]'))){
     numberCheck = true;
    }
    if(isUpdate) {
      ConfigLoaded();
    }
  }

}
