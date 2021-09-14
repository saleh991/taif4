import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/dio/dio_helper.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/contact_model.dart';
import 'package:taif/screens/secondary_screens/contact_screen/cubit/state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitState());

  static ContactCubit get(context) => BlocProvider.of(context);

  late ContactModel contactModel = ContactModel();

  void contact({
    required String subject,
    required String email,
    required String mobile,
    required String name,
    required String message,
  }) {
    emit(ContactLoadingState());
    DioHelper.init();
    DioHelper.postData(url: LOGIN, data: {
      'subject': subject,
      'email': email,
      'mobile': mobile,
      'name': name,
      'message': message,
    }).then((value) {
      contactModel = ContactModel.fromJson(value.data);
      print('${contactModel.status}');
      emit(ContactSuccessState());
    }).catchError((e) {
      print('Error Login Screen $e');
      emit(ContactErrorState());
    });
  }
}
