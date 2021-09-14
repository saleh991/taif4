import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/dio/dio_helper.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/user_data_model.dart';
import 'package:taif/screens/auth_screen/login_screen/cubit/states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool visibility = true;

  void changeVisibility() {
    visibility = !visibility;
    emit(PasswordVisibilityState());
  }

   UserDataModel userDataModel = UserDataModel();

  void login({
    required String phone,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.init();
    DioHelper.postData(url: LOGIN, data: {
      'phone': phone,
      'password': password,
    }).then((value) {
      userDataModel = UserDataModel.fromJson(value.data);
      AppController.instance.setId(userDataModel.data!.id!);
      print('${userDataModel.data!.id}');
      emit(LoginSuccessState());
    }).catchError((e) {
      print('Error Login Screen $e');
      emit(LoginErrorState());
    });
  }
}
