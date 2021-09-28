import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/dio/dio_helper.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/package_model.dart';
import 'package:taif/models/packages_id_model.dart';
import 'package:taif/models/user_data_model.dart';
import 'package:taif/screens/auth_screen/edit_profile/cubit/state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitState());

  static ProfileCubit get(context) => BlocProvider.of(context);

   UserDataModel userDataModel =UserDataModel();

  bool changePassword = false;
  bool visibility = true;
  String name = '';

  void changeVisibility() {
    visibility = !visibility;
    emit(ChangePasswordVisibilityState());
  }

  void changedPassword() {
    changePassword = !changePassword;
    emit(ChangePasswordState());
  }

  void getUserData() {
    emit(ProfileLoadingState());
    print('loading get id ${AppController.instance.getId()}');
    DioHelper.init();
    DioHelper.getData(url: 'users/${AppController.instance.getId()}').then((value) {
      print('i am here ');

      if (value.statusCode == 200) {
        print('here profile');
        print(value.data);

        print('here profile');
        userDataModel = UserDataModel.fromJson(value.data);
        print('user data ${userDataModel.data!.id}');
      }
      emit(ProfileSuccessState());
    }).catchError((e) {
      print('userData error $e');
      emit(ProfileErrorState());
    });
  }

  Future<void> updateUserDataWithoutPassword({
    required String name,
    required String email,
    File? image
  }) async {
    print(AppController.instance.getId());
    emit(EditProfileLoadingState());
    DioHelper.init();
    String fileName = '';
    if(image!=null)
      fileName =image.path.split('/').last;
    var formData = FormData.fromMap({


      if(image!=null)
        "image":
        await MultipartFile.fromFile(image.path, filename:fileName),
      'email': email,
      'name': name,
      '_method':'PUT'

    });
    DioHelper.postData(
      url: 'users/${AppController.instance.getId()}',

      data: formData,
    ).then((value) {
      print(value.data.toString());
      print(value.data.toString());
      print(value.data.toString());
      userDataModel = UserDataModel.fromJson(value.data);
      getUserData();
      this.name = name;
      emit(EditProfileSuccessState());
    }).catchError((e) {
      emit(EditProfileErrorState());
    });
  }

  Future<void> updateUserDataWithPassword({
    required String name,
    required String email,
    required String password,
    File? image
  }) async {
    print('ammmmmmmmmm');
    emit(EditProfileLoadingState());
    DioHelper.init();
    print(AppController.instance.getId());
    String fileName = '';
    if(image!=null)
      fileName =image.path.split('/').last;
    var formData = FormData.fromMap({


      if(image!=null)
        "image":
        await MultipartFile.fromFile(image.path, filename:fileName),
      'email': email,
      'name': name,
      'password': password,
      '_method':'PUT'
    });
    DioHelper.postData(
      url: 'users/${ AppController.instance.getId()}',
      data: formData,
    ).then((value) {
      print(value.data.toString());
      userDataModel = UserDataModel.fromJson(value.data);
      this.name = name;
      getUserData();
      emit(EditProfileSuccessState());
    }).catchError((e) {
      print(e);
      emit(EditProfileErrorState());
    });
  }

  void logout(){

    userDataModel = UserDataModel();
emit(LogoutState());

  }




  // void getPackagesId({required int id}) {
  //   emit(PackagesIdLoadingState());
  //   DioHelper.init();
  //   DioHelper.getData(url: packageUrl(id)).then((value) {
  //     if (value.statusCode == 200) {
  //       print('packagesId');
  //       packageModel = PackagesIdModel.fromJson(value.data);
  //     }
  //     emit(PackagesIdSuccessState());
  //   }).catchError((e) {
  //     print('packagesId error ');
  //     emit(PackagesIdErrorState());
  //   });
  // }

}
