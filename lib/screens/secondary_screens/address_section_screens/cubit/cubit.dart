import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/dio/dio_helper.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/event_model.dart';
import 'package:taif/models/event_sections.dart';
import 'package:taif/models/haraj_category.dart';
import 'package:taif/models/haraj_model.dart';
import 'package:taif/models/haraj_only_category.dart';
import 'package:taif/models/location_model.dart';
import 'package:taif/models/guiding_model.dart';
import 'package:taif/models/locations_category.dart';
import 'package:taif/models/offer_section.dart';
import 'package:taif/models/offers_model.dart';
import 'package:taif/models/user_data_model.dart';
import 'package:taif/models/guide_model.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/states.dart';


class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit() : super(LocationsInitState());

  static LocationsCubit get(context) => BlocProvider.of(context);
  LocationModel locationModel = LocationModel();
  GuidingModel guidingModel= GuidingModel();
  GuideModel guideModel=GuideModel();
  HarajModel harajModel = HarajModel();
  EventModel eventModel = EventModel();
  EventSections eventSections = EventSections();
  OfferSection offerSection = OfferSection();
  OffersModel offersModel = OffersModel();
  HarajCategory harajCategory = HarajCategory();
  HarajOnlyCategory harajOnlyCategory = HarajOnlyCategory();
  UserDataModel userDataModel = UserDataModel();
  LocationsCategory locationsCategory = LocationsCategory();

  void getUserData() {
    emit(UserDataLoadingState());
    DioHelper.init();
    DioHelper.getData(url: 'users/${AppController.instance.getId()}')
        .then((value) {
      print('i am here  ');
      print('user id ${AppController.instance.getId()}');
      if (value.statusCode == 200) {
        print('here profile ');
        print(value.data);
        userDataModel = UserDataModel.fromJson(value.data);
      }
      emit(UserDataSuccessState());
    }).catchError((e) {
      print('userData error   $e');
      emit(UserDataErrorState());
    });
  }

  void getLocations() {
    emit(LocationsLoadingState());
    DioHelper.init();
    DioHelper.getData(url: 'location_services').then((value) {
      if (value.statusCode == 200) {
        print('LOCATIONS ID USER ${AppController.instance.getId()}');
        locationModel = LocationModel.fromJson(value.data);
      }
      emit(LocationsSuccessState());
    }).catchError((e) {
      print('LOCATIONS error $e');
      emit(LocationsErrorState());
    });
  }

  void getGuiding() {
    emit(GuidingLoadingState());
    DioHelper.init();
    DioHelper.getData(url: 'guide_posts').then((value) {
      if (value.statusCode == 200) {
        print('Guiding ID USER ${AppController.instance.getId()}');
        print(value.data);
        guidingModel = GuidingModel.fromJson(value.data);
      }
      emit(GuidingSuccessState());
    }).catchError((e) {
      print('Guiding error $e');
      emit(LocationsErrorState());
    });
  }

  void getAllGuide() {
    emit(GuidingLoadingState());
    DioHelper.init();
    DioHelper.getData(url: 'guides').then((value) {
      if (value.statusCode == 200) {
        print('Guide ID USER ${AppController.instance.getId()}');
        print(value.data);
        guideModel = GuideModel.fromJson(value.data);
      }
      emit(GuidingSuccessState());
    }).catchError((e) {
      print('guides error $e');
      emit(LocationsErrorState());
    });
  }

  void getLocationsCategory() {
    emit(GetLocationsCategoryLoadingState());
    DioHelper.init();
    DioHelper.getData(url: 'location_service_categories').then((value) {
      if (value.statusCode == 200) {
        print('LOCATIONS Category');
        locationsCategory = LocationsCategory.fromJson(value.data);
        getLocations();
      }
      emit(GetLocationsCategorySuccessState());
    }).catchError((e) {
      print('LOCATIONS Category error $e');
      emit(GetLocationsCategoryErrorState());
    });
  }

  void getHarajCategoryById({required int id}){
    emit(GetHarajCategoryIdLoadingState());
    DioHelper.init();
    DioHelper.getData(url: HARAJ_CATEGORY+'/$id').then((value) {
      if (value.statusCode == 200) {
        print('harajs ');
        harajOnlyCategory =HarajOnlyCategory.fromJson(value.data);
      }
      emit(GetHarajCategoryIdSuccessState());
    }).catchError((e) {
      print('harajs error $e');
      emit(GetHarajCategoryIdErrorState());
    });
  }

  void getHarajs() {
    emit(HarajsLoadingState());
    DioHelper.init();
    DioHelper.getData(url: harajs).then((value) {
      if (value.statusCode == 200) {
        print('harajs ID USER ${AppController.instance.getId()}');
        harajModel =HarajModel.fromJson(value.data);
      }
      emit(HarajsSuccessState());
    }).catchError((e) {
      print('harajs error $e');
      emit(HarajsErrorState());
    });
  }

  void getHarajCategory() {
    emit(GetHarajCategoryLoadingState());
    DioHelper.init();
    DioHelper.getData(url: HARAJ_CATEGORY).then((value) {
      if (value.statusCode == 200) {
        print('harajs Category');
        harajCategory =HarajCategory.fromJson(value.data);
        getHarajs();
      }
      emit(GetHarajCategorySuccessState());
    }).catchError((e) {
      print('harajs Category error $e');
      emit(GetHarajCategoryErrorState());
    });
  }
var value = 0;

  void changeLocationValue(val) {
    value = val;
    getLocationsByCat();
    emit(ChangLocationsState());

  }

  void getLocationsByCat() {
    emit(LocationsLoadingState());
    DioHelper.init();
    DioHelper.getData(url: 'location_services', query: {
      'location_service_category_id': value,
    }).then((value) {
      if (value.statusCode == 200) {
        print('locations');
        locationModel = LocationModel.fromJson(value.data);

      }
      emit(LocationsSuccessState());
    }).catchError((e) {
      print('locations error $e');
      emit(LocationsErrorState());
    });
  }

  void changeValue(val) {
    value = val;
    getHarajByCat();
      emit(ChangHarajState());

  }

  void getHarajByCat() {
    emit(HarajsLoadingState());
    DioHelper.init();
    DioHelper.getData(url: harajs, query: {
      'haraj_category_id': value,
    }).then((value) {
      if (value.statusCode == 200) {
        print('ESTATES');
        harajModel = HarajModel.fromJson(value.data);

      }
      emit(HarajsSuccessState());
    }).catchError((e) {
      print('ESTATES error $e');
      emit(HarajsErrorState());
    });
  }

  void getEventSections() {
    emit(EventSectionsLoadingState());
    DioHelper.init();
    DioHelper.getData(url: EVENT_SECTIONS).then((value) {
      if (value.statusCode == 200) {
        print('EventSections success');
        eventSections =EventSections.fromJson(value.data);
        getEvents();
      }
      emit(EventSectionsSuccessState());
    }).catchError((e) {
      print('EventSections error $e');
      emit(EventSectionsErrorState());
    });
  }

  void getOfferSections() {
    emit(OfferSectionsLoadingState());
    DioHelper.init();
    DioHelper.getData(url: OFFERS_SECTIONS).then((value) {
      if (value.statusCode == 200) {
        print('OfferSections success');
        offerSection =OfferSection.fromJson(value.data);
        getOffers();
      }
      emit(OfferSectionsSuccessState());
    }).catchError((e) {
      print('OfferSections error $e');
      emit(OfferSectionsErrorState());
    });
  }

  void getEvents() {
    emit(EventLoadingState());
    DioHelper.init();
    DioHelper.getData(url: EVENTS).then((value) {
      if (value.statusCode == 200) {
        print('getEvents ID USER ${AppController.instance.getId()}');
        eventModel =EventModel.fromJson(value.data);
      }
      emit(EventSuccessState());
    }).catchError((e) {
      print('getEvents error $e');
      emit(EventErrorState());
    });
  }


  void getOffers() {
    emit(OfferLoadingState());
    DioHelper.init();
    DioHelper.getData(url: OFFERS).then((value) {
      if (value.statusCode == 200) {
        print('getOffer ');
        offersModel =OffersModel.fromJson(value.data);
      }
      emit(OfferSuccessState());
    }).catchError((e) {
      print('getOffer error $e');
      emit(OfferErrorState());
    });
  }
}