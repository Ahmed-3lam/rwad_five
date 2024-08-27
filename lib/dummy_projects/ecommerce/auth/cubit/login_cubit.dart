import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:rwad/dummy_projects/ecommerce/const/KApis.dart';
import 'package:rwad/dummy_projects/ecommerce/helpers/dio_helper.dart';
import 'package:rwad/dummy_projects/ecommerce/helpers/hive_helper.dart';
import 'package:rwad/dummy_projects/ecommerce/main/main_screen.dart';

import '../model/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  LoginModel model = LoginModel();
  void login({
    required String email,
    required String password,
    String? name,
    String? phone,
    bool isRegister = false,
  }) async {
    emit(LoginLoadingState());
    try {
      final response = await DioHelper.postData(
        path: isRegister ? KApis.register : KApis.login,
        body: {
          "email": email,
          "password": password,
          if (isRegister) "name": name,
          if (isRegister) "phone": phone,
        },
      );
      model = LoginModel.fromJson(response.data);
      if (model.status == true) {
        HiveHelper.setToken(model.data?.token ?? "");
        Get.offAll(MainScreen());
        emit(LoginSuccessState(model.message ?? ""));
      } else {
        emit(LoginErrorState(model.message ?? ""));
      }
    } catch (e) {
      emit(LoginErrorState("Connection is bad"));
    }
  }
}
