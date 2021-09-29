import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/dio/dio_helper.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/documentations_model.dart';
import 'package:taif/models/taif_model.dart';
import 'package:taif/screens/secondary_screens/contracts_section_screens/cubit/state.dart';
import 'package:taif/screens/secondary_screens/documentation_screen/cubit/state.dart';
import 'package:taif/screens/secondary_screens/know_taif/cubit/state.dart';

class TaifCubit extends Cubit<TaifState> {
  TaifCubit() : super(TaifInitState());

  static TaifCubit get(context) => BlocProvider.of(context);

  TaifModel taifModel = TaifModel();

  void getTaif() {
    emit(GetTaifLoadingState());
    DioHelper.init();
    DioHelper.getData(url: 'posts?tag_id=1').then((value) {
      if (value.statusCode == 200) {
        print('taif');
        taifModel = TaifModel.fromJson(value.data);
      }
      emit(GetTaifSuccessState());
    }).catchError((e) {
      print('taif error ');
      emit(GetTaifErrorState());
    });
  }

}
