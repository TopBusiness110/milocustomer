import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milocustomer/core/models/config_model.dart';
import 'package:milocustomer/core/remote/service.dart';
import 'package:milocustomer/features/login/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  bool acceptTerms=false;

  LoginCubit(this.api) : super(InitLoginState()){
    getconfig();
  }
  ServiceApi api;
  ConfigModel? configModel;
  bool isActiveRememberMe = false;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwprdController = TextEditingController();

  int currentUser = 0; //0 admin 1 driver  2  user
  void toggleTerms() {
    acceptTerms = !acceptTerms;
    emit(UserState());

  }

  toggleDriver(){
    currentUser = 1 ;
    emit(DriverState());
  }


  toggleUser(){
    currentUser = 2 ;
    emit(UserState());
  }

  bool isPassword = true;

  togglePassword() {
    isPassword = !isPassword;
    emit(ChangePasswordState());
  }
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
  void toggleRememberMe() {
    isActiveRememberMe = !isActiveRememberMe;
    emit(ConfigLoaded());
  }
}
