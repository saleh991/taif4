import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/dio/dio_helper.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/estate_comment_model.dart';
import 'package:taif/models/estate_model.dart';
import 'package:taif/models/estate_only_model.dart';
import 'package:taif/models/map_model.dart';
import 'package:taif/models/terms_model.dart';
import 'package:taif/models/user_comment.dart';
import 'package:taif/models/user_data_model.dart';
import 'package:taif/screens/primary_screens/estates_section/cubit/states.dart';

class EstatesCubit extends Cubit<EstatesState> {
  EstatesCubit() : super(EstatesInitState());

  static EstatesCubit get(context) => BlocProvider.of(context);

  EstateModel estateModel = EstateModel();
  TermsModel termsModel = TermsModel();
  EstateModel myEstateModel = EstateModel();
  UserCommentModel userCommentModel = UserCommentModel();
  List<UserCommentModel> commentList = [];
  UserDataModel userDataModel = UserDataModel();
  UserDataModel userDataComment = UserDataModel();
  MapModel mapModel = MapModel();
EstateCommentModel estateCommentModel = EstateCommentModel();
EstateOnlyModel estateOnlyModel = EstateOnlyModel();
  void getEstates() {
    emit(EstatesLoadingState());
    DioHelper.init();
    DioHelper.getData(url: ESTATE).then((value) {
      if (value.statusCode == 200) {
        print('ESTATES');
        print(value.data);
        print('ESTATES');
        estateModel = EstateModel.fromJson(value.data);
      }
      emit(EstatesSuccessState());
    }).catchError((e) {
      print('ESTATES error $e');
      emit(EstatesErrorState());
    });
  }

  void getOnlyEstate({
  required int estateId,
}) {
    emit(EstateOnlyLoadingState());
    DioHelper.init();
    DioHelper.getData(url: ESTATE+'/$estateId').then((value) {
      if (value.statusCode == 200) {
        print('getOnlyEstate');
        estateOnlyModel = EstateOnlyModel.fromJson(value.data);
        getCommentEstate(estateId: estateId);
      }
      emit(EstateOnlySuccessState());
    }).catchError((e) {
      print('getOnlyEstate error $e');
      emit(EstateOnlyErrorState());
    });
  }

  void getMyEstates() {
    emit(MyEstatesLoadingState());
    DioHelper.init();
    DioHelper.getData(
        url: ESTATE,
        query: {'user_id': '${AppController.instance.getId()}'}).then((value) {
      if (value.statusCode == 200) {
        print('my ESTATES');
        myEstateModel = EstateModel.fromJson(value.data);
      }
      emit(MyEstatesSuccessState());
    }).catchError((e) {
      print('my ESTATES error $e');
      emit(MyEstatesErrorState());
    });
  }

  void getUserData() {
    emit(UserDataLoadingState());
    DioHelper.init();
    DioHelper.getData(url: 'users/${AppController.instance.getId()}')
        .then((value) {
      print('i am here estate ');
      print('user id ${AppController.instance.getId()}');
      if (value.statusCode == 200) {
        print('here profile estate');
        userDataModel = UserDataModel.fromJson(value.data);
      }
      getCategories();
      emit(UserDataSuccessState());
    }).catchError((e) {
      print('userData error estate  $e');
      emit(UserDataErrorState());
    });
  }

  void getAnyUserData({required int id,required int estateId}) {
    emit(UserDataLoadingState());
    DioHelper.init();
    DioHelper.getData(url: 'users/$id').then((value) {
      print('i am here estate ');
      print('user id ${AppController.instance.getId()}');
      if (value.statusCode == 200) {
        print('here profile estate');
        userDataComment = UserDataModel.fromJson(value.data);
      }
      getCommentEstate(estateId: estateId);
      emit(UserDataSuccessState());
    }).catchError((e) {
      print('userData error estate  $e');
      emit(UserDataErrorState());
    });
  }

  void getCategories() {
    emit(GetCategoriesLoadingState());
    DioHelper.init();
    DioHelper.getData(url: MAP).then((value) {
      if (value.statusCode == 200) {
        print('here profile estate');
        mapModel = MapModel.fromJson(value.data);
      }
      getEstates();
      emit(GetCategoriesSuccessState());
    }).catchError((e) {
      print('userData error estate  $e');
      emit(GetCategoriesErrorState());
    });
  }

  var value = 1;

  void changeValue(val) {
    value = val;
    if (value == 3) {
      emit(GoToDocumentationState());
    } else if (value == 4) {
      emit(GoToContractState());
    } else {
      print('$value');
      getEstatesByCat();
      emit(ChangeValueState());
    }
  }

  void getEstatesByCat() {
    emit(EstatesLoadingState());
    DioHelper.init();
    DioHelper.getData(url: ESTATE, query: {
      'estate_category_id': value,
    }).then((value) {
      if (value.statusCode == 200) {
        print('ESTATES');
        estateModel = EstateModel.fromJson(value.data);
      }
      emit(EstatesSuccessState());
    }).catchError((e) {
      print('ESTATES error $e');
      emit(EstatesErrorState());
    });
  }

  void createChat({
    required int subjectId,
  }) {
    emit(CreateNewChatLoadingState());
    DioHelper.init();
    DioHelper.getData(url: 'chats', query: {
      'user_id': AppController.instance.getId(),
      'subject_id': subjectId,
    }).then((value) {
      if (value.statusCode == 200) {
        print('createChat');
        emit(CreateNewChatSuccessState());
      }
    }).catchError((e) {
      print('createChat error $e');
      emit(CreateNewChatErrorState());
    });
  }

void getCommentEstate({
  required int estateId,
}){
  emit(GetCommentLoadingState());
  DioHelper.init();
  DioHelper.getData(url: COMMENT, query: {
    'estate_id': estateId,

  }).then((value) {
    if (value.statusCode == 200) {
      print('getCommentEstate');

estateCommentModel = EstateCommentModel.fromJson(value.data);
      emit(GetCommentSuccessState());
    }
  }).catchError((e) {
    print('getCommentEstate error $e');
    emit(GetCommentErrorState());
  });
}

  Future<void> getTermsAndAgreements({
    required int id,
  }) async {
    emit(GetTermsLoadingState());
    DioHelper.init();
    DioHelper.getData(url: 'pages/$id').then((value) {
      if (value.statusCode == 200) {
        print('getTerms');

        termsModel = TermsModel.fromJson(value.data);
        emit(GetTermsSuccessState());
      }
    }).catchError((e) {
      print('error $e');
      emit(GetTermsErrorState());
    });
  }

  void addComment({
    required String content,
    required int estateId,
  }) {
    emit(AddCommentLoadingState());
    DioHelper.init();
    DioHelper.postData(url: COMMENT, data: {
      'content': content,
      'estate_id': estateId,
      'user_id': AppController.instance.getId(),
    }).then((value) {
      getAnyUserData(estateId: estateId,id: AppController.instance.getId());
      emit(AddCommentSuccessState());
    }).catchError((e) {
      print('Error Login Screen $e');
      emit(AddCommentErrorState());
    });
  }


  Future<void> addEstate({

    required String type,
    required String auth_option,
    required String ownership,
    required String payType,

    required String area,
    required String price,
    required String description,
    required String title,
    required String location_lat,
    required String location_lng,
    required File image,
    required List<File> images,
    required int es,
    required int show_phone,
    required int comments_enabled,
    required int side_id



  }) async {
    String fileName = '';

      fileName =image.path.split('/').last;
    DioHelper.init();
    List<String> fileImagesName=[];

    List imagesFile=[];


    for(int i=0;i<images.length;i++){
      fileImagesName.add(images[i].path.split('/').last);
      imagesFile.add(await MultipartFile.fromFile(images[i].path, filename:fileImagesName[i])) ;
    }
    var formData = FormData.fromMap({
      "side_id":side_id.toString(),
      "user_id":AppController.instance.getId().toString(),
     "type":type,
      "auth_option":auth_option,
      "location_lng":location_lng,
      "location_lat":location_lat,
      "title":title,
      "description":description,
      "price":price,
      "area":area,
      "ownership":ownership,
      "estate_category_id":es.toString(),
      "show_phone":show_phone,
      "comments_enabled":comments_enabled,
      "pay_type":payType,
        "image":
        await MultipartFile.fromFile(image.path, filename:fileName),
      for(int i=0;i<imagesFile.length;i++)
        "images[$i]":
        imagesFile[i],



    });
    DioHelper.postData(url: 'estates', data: formData).then((value) {

      print("value.data");
      print(value.data);
      print(value.statusCode);
      print("value.data");


    }).catchError((e) {
      print('Error  Screen $e');

    });
  }





}
