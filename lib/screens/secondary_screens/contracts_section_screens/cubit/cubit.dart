import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/dio/dio_helper.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/screens/secondary_screens/contracts_section_screens/cubit/state.dart';

class RequestLeaseCubit extends Cubit<RequestLeaseState> {
  RequestLeaseCubit() : super(RequestLeaseInitState());

  static RequestLeaseCubit get(context) => BlocProvider.of(context);

  void requestLease({
    required String name,
    required String phone,
    required int leaseContractId,
  }) {
    emit(RequestLeaseLoadingState());
    DioHelper.init();
    DioHelper.postData(url: REQUEST_LEASE, data: {
      'name': phone,
      'mobile': phone,
      'lease_contract_id': leaseContractId,
      'user_id': AppController.instance.getId(),
    }).then((value) {
      emit(RequestLeaseSuccessState());
    }).catchError((e) {
      print('Error RequestLease Screen $e');
      emit(RequestLeaseErrorState());
    });
  }
}
