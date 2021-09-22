import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/dio/dio_helper.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/english_section_model.dart';
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
import 'package:taif/models/add_guide_model.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/states.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/offers_sections/add_offers_screnn.dart';


class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit() : super(LocationsInitState());

  static LocationsCubit get(context) => BlocProvider.of(context);
  LocationModel locationModel = LocationModel();
  GuidingModel guidingModel= GuidingModel();
  AddGuideModel addGuideModel=AddGuideModel();
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
  EnglishSectionModel englishSectionModel=EnglishSectionModel();

  void getUserData() {
    emit(UserDataLoadingState());
    DioHelper.init();
    DioHelper.getData(url: 'users/${AppController.instance.getId()}')
        .then((value) {
      print('i am here  ');
      print(value.data);
      print('i am here  ');
      if (value.statusCode == 200) {
        print(' profile ');
        print(value.data);
        print(' profile ');
        userDataModel = UserDataModel.fromJson(value.data);
      }
      emit(UserDataSuccessState());
    }).catchError((e) {
      print('userData error   $e');
      emit(UserDataErrorState());
    });
  }



  Future<void> getLocations() async {
    emit(LocationsLoadingState());
    late LocationData currentLocation;
    var location = new Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {

    }
    DioHelper.init();
    DioHelper.getData(url: 'location_services').then((value) async {
      if (value.statusCode == 200) {
        print('LOCATIONS ID USER ${AppController.instance.getId()}');

        print('LOCATIONS ID USER ${AppController.instance.getId()}');
        locationModel = LocationModel.fromJson(value.data);
        for(var lo in locationModel.data!)
          {  lo.km=0;
            if(lo.locationLng!=null)
              {
                double _distanceInMeters = Geolocator.distanceBetween(
                  double?.tryParse(lo.locationLat!)!,
                  double?.tryParse(lo.locationLng!)!,
                  currentLocation.latitude!,
                  currentLocation.longitude!,
                );
                print("_distanceInMeters");
                print(_distanceInMeters/1000);
                lo.km=double.tryParse((_distanceInMeters/1000).toStringAsFixed(3));
                print( lo.km);
                print("_distanceInMeters");
              }

          }

        emit(LocationsSuccessState());
      }

    }).catchError((e) {
      print('LOCATIONS error $e');
      emit(LocationsErrorState());
    });
  }

  void getLocationsEn() {
    emit(LocationsLoadingState());
    DioHelper.init();
    DioHelper.getData(url: 'en_location_services').then((value) {
      if (value.statusCode == 200) {
        print('en_location_services');
        print(value.data);
        print('en_location_services');
        print('LOCATIONS ID USER ${AppController.instance.getId()}');
        englishSectionModel = EnglishSectionModel.fromJson(value.data);
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
        harajModel =HarajModel.fromJson(value.data);
        print('haraj');
        print(value.data);
        print('haraj');
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


  Future<void> addGuid({
    required String name,
    required String phone,
    required String password,
    required String experience_years,
    required String notes,
    required String email,
    required File image
  }) async {
    emit(AddGuideLoadingState());
    DioHelper.init();

    String fileName = image.path.split('/').last;
    FormData formData = FormData.fromMap({
      "image":
      await MultipartFile.fromFile(image.path, filename:fileName),
      'name': name,
      'phone': phone,
      'password': password,
      'experience_years': experience_years,
      'email': email,
      'notes': notes,
    });
    DioHelper.postData(url: 'guides',
        data: formData).then((value) {
      if(value.statusCode! >= 200&&value.statusCode!<= 300){
        print("value.data");
        print(value.data);
        print("value.data");
        addGuideModel = AddGuideModel.fromJson(value.data);
        emit(AddGuideSuccessState(addGuideModel));
      }
    }).catchError((e) {
      print('Error   $e');
      emit(AddGuideErrorState());
    });
  }


  Future<void> addLocation({
    required String title,
    required String phone,
    required String content,
    required String location_service_category_id,
    required String location_lat,
    required String location_lng,
    required File image
  }) async {
    emit(AddLocationLoadingState());
    DioHelper.init();

    String fileName = image.path.split('/').last;
    FormData formData = FormData.fromMap({
      "image":
      await MultipartFile.fromFile(image.path, filename:fileName),
      'title': title,
      'phone': phone,
      'content': content,
      'location_service_category_id': location_service_category_id,
      'location_lat': location_lat,
      'location_lng': location_lng,
    });
    DioHelper.postData(url: 'location_services',
        data: formData).then((value) {
      if(value.statusCode! >= 200&&value.statusCode!<= 300){
        print("value.data");
        print(value.data);
        print("value.data");
        addGuideModel = AddGuideModel.fromJson(value.data);
        emit(AddLocationSuccessState());
      }
    }).catchError((e) {
      print('Error   $e');
      emit(AddLocationErrorState());
    });
  }


  Future<void> addHaraj({
    required String haraj_category_id,

    required String title,
     File? image,
     List<File>? images,
     List<File>? videos,

    required String message,
    required String user_id,
  }) async {
    List<String> fileImagesName=[];
    List<String> videoImagesName=[];
    List imagesFile=[];
    List <MultipartFile>videosFile=[];

    for(int i=0;i<images!.length;i++){
      fileImagesName.add(images[i].path.split('/').last);
      imagesFile.add(await MultipartFile.fromFile(images[i].path, filename:fileImagesName[i])) ;
    }
    for(int i=0;i<videos!.length;i++){
      videoImagesName.add(videos[i].path.split('/').last);
      videosFile.add( await MultipartFile.fromFile(videos[i].path, filename:videoImagesName[i]));
    }
    String fileName = '';
    if(image!=null)
      fileName =image.path.split('/').last;

    DioHelper.init();
    var formData = FormData.fromMap({
      "user_id":user_id,
      'haraj_category_id': haraj_category_id,
      if(image!=null)
          "image":
          await MultipartFile.fromFile(image.path, filename:fileName),
      for(int i=0;i<imagesFile.length;i++)
        "images[$i]":
       imagesFile[i],
      for(int i=0;i<videosFile.length;i++)
        "videos[$i]": videosFile[i],
      'title': title,
      'message': message,
    });


    DioHelper.postData(url: 'harajs',
        data: formData).then((value) {
      print("value.data");
      print(value.data);
      print("value.data");
      if(value.statusCode! >= 200&&value.statusCode!<= 300){
        print("value.data");
        print(value.data);
        print("value.data");


      }
    }).catchError((e) {
      print('Error   $e');

    });
  }



  Future<void> addOffer({
    required String title,
    File? image,
    required String message,
    required String user_id,
  }) async {
    String fileName = '';
    if(image!=null)
      fileName =image.path.split('/').last;
    DioHelper.init();
    var formData = FormData.fromMap({
      "user_id":user_id,
      "tag_id":"3",
      if(image!=null)
        "image":
        await MultipartFile.fromFile(image.path, filename:fileName),
      'title': title,
      'content': message,
    });
    print("value.data");
    print(user_id);
    print("value.data");

    DioHelper.postData(url: 'posts',
        data: formData).then((value) {
      print("value.data");
      print(user_id);
      print("value.data");
      if(value.statusCode! >= 200&&value.statusCode!<= 300)
      {
        print("value.data");
        print(value.data);
        print("value.data");


      }
    }).catchError((e) {
      print('Error   $e');

    });
  }


  Future<void> addTouristShow({


    required String title,
    File? image,
    List<File>? images,
    List<File>? videos,

    required String content,
    required String guide_id,
  }) async {
    List<String> fileImagesName=[];
    List<String> videoImagesName=[];
    List imagesFile=[];
    List <MultipartFile>videosFile=[];

    for(int i=0;i<images!.length;i++){
      fileImagesName.add(images[i].path.split('/').last);
      imagesFile.add(await MultipartFile.fromFile(images[i].path, filename:fileImagesName[i])) ;
    }
    for(int i=0;i<videos!.length;i++){
      videoImagesName.add(videos[i].path.split('/').last);
      videosFile.add( await MultipartFile.fromFile(videos[i].path, filename:videoImagesName[i]));
    }
    String fileName = '';
    if(image!=null)
      fileName =image.path.split('/').last;

    DioHelper.init();
    var formData = FormData.fromMap({
      "guide_id":"9",

      if(image!=null)
        "image":
        await MultipartFile.fromFile(image.path, filename:fileName),
      for(int i=0;i<imagesFile.length;i++)
        "images[$i]":
        imagesFile[i],
      for(int i=0;i<videosFile.length;i++)
        "videos[$i]": videosFile[i],
      'title': title,
      'content': content,
    });


    DioHelper.postData(url: 'guide_posts',
        data: formData).then((value) {
      print("value.data");
      print(value.data);
      print("value.data");
      if(value.statusCode! >= 200&&value.statusCode!<= 300){
        print("value.data");
        print(value.data);
        print("value.data");


      }
    }).catchError((e) {
      print('Error   $e');

    });
  }

  Future<void> addReportTourism({
    required String report_title,
    required String report_content,
    required String user_id,
  }) async {

    DioHelper.init();
    FormData formData = FormData.fromMap({

      'report_title': report_title,
      'report_content': report_content,
      'report_by': user_id,
      'report_on': '1',
      'report_on_class': 'App\\Models\\Estate',

    });
    DioHelper.postData(url: 'reports',
        data: formData).then((value) {
      if(value.statusCode! >= 200&&value.statusCode!<= 300){
        print("value.data");
        print(value.data);
        print("value.data");
      }
    }).catchError((e) {
      print('Error   $e');

    });
  }




}