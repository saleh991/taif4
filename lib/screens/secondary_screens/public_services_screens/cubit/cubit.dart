import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/dio/dio_helper.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/home_service_categories_model.dart';
import 'package:taif/models/services_model.dart';
import 'package:taif/screens/secondary_screens/public_services_screens/cubit/states.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(ServicesInitState());

  static ServicesCubit get(context) => BlocProvider.of(context);

  ServicesModel servicesModel = ServicesModel();
  HomeServiceCategoriesModel homeServiceCategoriesModel = HomeServiceCategoriesModel();

  void getServices() {
    emit(ServicesLoadingState());
    DioHelper.init();
    DioHelper.getData(url: SERVICES).then((value) {
      if (value.statusCode == 200) {
        print('packages');
        servicesModel = ServicesModel.fromJson(value.data);
      }
      emit(ServicesSuccessState());
    }).catchError((e) {
      print('packages error ');
      emit(ServicesErrorState());
    });
  }
  void getServicesCategory() {
    emit(ServicesCategoryLoadingState());
    DioHelper.init();
    DioHelper.getData(url: SERVICES_CATEGORY).then((value) {
      if (value.statusCode == 200) {
        print('ServicesCategory');
        homeServiceCategoriesModel = HomeServiceCategoriesModel.fromJson(value.data);
        getServices();
      }
      emit(ServicesCategorySuccessState());
    }).catchError((e) {
      print('ServicesCategory error ');
      emit(ServicesCategoryErrorState());
    });
  }

var value = 0;
  void changeValue(val) {
    value = val;
    getServicesByCat();
    emit(ChangeServicesState());

  }
  void getServicesByCat() {
    emit(ServicesByCategoryLoadingState());
    DioHelper.init();
    DioHelper.getData(url: SERVICES, query: {
      'home_service_category_id': value,
    }).then((value) {
      if (value.statusCode == 200) {
        print('getServicesByCat');
        servicesModel = ServicesModel.fromJson(value.data);

      }
      emit(ServicesByCategorySuccessState());
    }).catchError((e) {
      print('getServicesByCat error $e');
      emit(ServicesByCategoryErrorState());
    });
  }

}