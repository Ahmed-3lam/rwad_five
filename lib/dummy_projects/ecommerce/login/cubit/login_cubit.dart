import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:rwad/dummy_projects/ecommerce/helpers/KApis.dart';
import 'package:rwad/dummy_projects/ecommerce/helpers/dio_helper.dart';
import 'package:rwad/dummy_projects/ecommerce/login/model/login_model.dart';
import 'package:rwad/dummy_projects/ecommerce/main/main_screen.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  LoginModel model = LoginModel();
  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      final response = await DioHelper.postData(
        path: KApis.login,
        body: {
          "email": email,
          "password": password,
        },
      );
      model = LoginModel.fromJson(response.data);
      if (model.status == true) {
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
