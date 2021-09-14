import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/dio/dio_helper.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/register_model.dart';
import 'package:taif/models/user_data_model.dart';
import 'package:taif/screens/auth_screen/register_screen/cubit/state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitState());

  static RegisterCubit get(context) => BlocProvider.of(context);
UserDataModel userDataModel = UserDataModel();
  RegisterModel registerModel = RegisterModel();
String phone = '';
  void register({
    required String phone,
  }) {
    emit(RegisterLoadingState());
    DioHelper.init();
    DioHelper.postData(url: REGISTER, data: {
      'phone': phone,
    }).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      print('${registerModel.status}');
      AppController.instance.setId(registerModel.data!.id!);
      emit(RegisterSuccessState());
    }).catchError((e) {
      print('Error Login Screen $e');
      emit(RegisterErrorState());
    });
  }
  void getUserData() {
    emit(RegisterGetUserDataLoadingState());
    DioHelper.init();
    DioHelper.getData(url: 'users/${AppController.instance.getId()}').then((value) {
      if (value.statusCode == 200) {
        print('here register data');
        userDataModel = UserDataModel.fromJson(value.data);
        print('user here register data ${userDataModel.data!.id}');
      }
      emit(RegisterGetUserDataSuccessState());
    }).catchError((e) {
      print('here register data error $e');
      emit(RegisterGetUserDataErrorState());
    });
  }
}
