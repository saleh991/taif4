import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/dio/dio_helper.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/documentations_model.dart';
import 'package:taif/screens/secondary_screens/contracts_section_screens/cubit/state.dart';
import 'package:taif/screens/secondary_screens/documentation_screen/cubit/state.dart';

class DocumentationCubit extends Cubit<DocumentationState> {
  DocumentationCubit() : super(DocumentationInitState());

  static DocumentationCubit get(context) => BlocProvider.of(context);

  DocumentationsModel documentationsModel = DocumentationsModel();

  void getDocumentation() {
    emit(DocumentationLoadingState());
    DioHelper.init();
    DioHelper.getData(url: DOCUMENTATIONS).then((value) {
      if (value.statusCode == 200) {
        print('documentations');
        documentationsModel = DocumentationsModel.fromJson(value.data);
      }
      emit(DocumentationSuccessState());
    }).catchError((e) {
      print('documentations error ');
      emit(DocumentationErrorState());
    });
  }
  void requestDocumentation({
    required String name,
    required String phone,
    required int id,
  }) {
    emit(RequestDocumentationLoadingState());
    DioHelper.init();
    DioHelper.postData(url: REQUEST_DOCUMENTATION, data: {
      'name': phone,
      'phone': phone,
      'documentation_id': id,
      'user_id': AppController.instance.getId(),
    }).then((value) {
      emit(RequestDocumentationSuccessState());
    }).catchError((e) {
      print('Error RequestLease $e');
      emit(RequestDocumentationErrorState());
    });
  }
}
