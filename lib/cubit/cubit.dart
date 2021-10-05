import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/cubit/state.dart';
import 'package:taif/dio/dio_helper.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/estate_model.dart';
import 'package:taif/models/favorite_model.dart';
import 'package:taif/models/lease_model.dart';
import 'package:taif/models/notification_model.dart';
import 'package:taif/models/settings_model.dart';
import 'package:taif/models/slider_model.dart';
import 'package:taif/screens/primary_screens/home_screen.dart';
import 'package:taif/screens/primary_screens/notifications_screen.dart';
import 'package:taif/screens/primary_screens/profile_screen.dart';
import 'package:taif/screens/primary_screens/search_screen.dart';

import '../global.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(PackagesInitState());

  static MainCubit get(context) => BlocProvider.of(context);
  SliderModel sliderModel = SliderModel();
  SettingsModel settingsModel = SettingsModel();
  EstateModel estateModel = EstateModel();
  LeaseModel leaseModel = LeaseModel();
  NotificationModel notificationModel = NotificationModel();
  FavoriteModel favoriteModel = FavoriteModel();

  List<Widget> screen = [
    HomeScreen(),
    SearchScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];
  int currentIndex = 0;



  // void getPackagesId({required int id}) {
  //   emit(PackagesIdLoadingState());
  //   DioHelper.init();
  //   DioHelper.getData(url: packageUrl(id)).then((value) {
  //     if (value.statusCode == 200) {
  //       print('packagesId');
  //       packageModel = PackageModel.fromJson(value.data);
  //     }
  //     emit(PackagesIdSuccessState());
  //   }).catchError((e) {
  //     print('packagesId error ');
  //     emit(PackagesIdErrorState());
  //   });
  // }
  void changeState(int index) {
    currentIndex = index;
    emit(MainChangeState());
  }
  void getSlider() {
    emit(SliderLoadingState());
    DioHelper.init();
    DioHelper.getData(url: SLIDER).then((value) {
      if (value.statusCode == 200) {
        print('${value.data}');
        sliderModel = SliderModel.fromJson(value.data);
        print('images cubit ${sliderModel.data![1].image}');
      }
      emit(SliderSuccessState());
    }).catchError((e) {
      print('slider error ');
      emit(SliderErrorState());
    });
    //GETSettings
    DioHelper.getData(url: 'get/settings').then((value) {
      if (value.statusCode == 200) {
        print('${value.data}');
        settingsModel = SettingsModel.fromJson(value.data);
        Global.hideContracts=settingsModel.hide_contracts;
        Global.hideDocumentations=settingsModel.hide_documentations;
        print('images cubit ${sliderModel.data![1].image}');
      }

    }).catchError((e) {
      print('slider error ');

    });
  }
  void removeFromFav({
    required int estateId,
    required String model,
  }) {

    DioHelper.init();
    DioHelper.postData(url: 'favorites/remove', data: {
      'model': model,
      'id': estateId,
      'user_id': AppController.instance.getId(),
    }).then((value) {
      print("value");
      print(value);
      print("ba");


    }).catchError((e) {
      print('Error add Fav $e');

    });
  }
  void getSearchData({
    required String searchTitle,
  }) {
    emit(SearchLoadingState());
    DioHelper.init();
    DioHelper.getData(url: ESTATE, query: {
      'search': searchTitle,
    }).then((value) {
      if (value.statusCode == 200) {
        print('${value.data}');
        estateModel = EstateModel.fromJson(value.data);
      }
      emit(SearchSuccessState());
    }).catchError((e) {
      print('search error ');
      emit(SearchErrorState());
    });
  }

  void getLease() {
    emit(LeaseLoadingState());
    DioHelper.init();
    DioHelper.getData(url: LEASE).then((value) {
      if (value.statusCode == 200) {
        print('lease data ${value.data}');
        leaseModel = LeaseModel.fromJson(value.data);
      }
      emit(LeaseSuccessState());
    }).catchError((e) {
      print('lease error ');
      emit(LeaseErrorState());
    });
  }


  void getNotifications() {
    emit(NotificationsLoadingState());
    DioHelper.init();
    DioHelper.getData(url: 'notifications?user_id=${AppController.instance.getId()}').then((value) {
      if (value.statusCode == 200) {
        print('notifications data ${value.data}');
        notificationModel = NotificationModel.fromJson(value.data);
      }
      emit(NotificationsSuccessState());
    }).catchError((e) {
      print('notifications error $e');
      emit(NotificationsErrorState());
    });
  }

AppModelsEstate appModelsEstate = AppModelsEstate();

  void getFavorites() {
    emit(FavoriteLoadingState());
    DioHelper.init();
    DioHelper.getData(url: 'favorites?user_id=${AppController.instance.getId()}').then((value) {
      if (value.statusCode == 200) {
        print('favorites');
        print(value.data);
        print('favorites');
        favoriteModel = FavoriteModel.fromJson(value.data);
      }
      emit(FavoriteSuccessState());
    }).catchError((e) {
      print('favorites error ');
      emit(FavoriteErrorState());
    });
  }

}
