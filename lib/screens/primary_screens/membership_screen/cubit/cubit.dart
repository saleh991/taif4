import 'dart:convert';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:taif/helper/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/dio/dio_helper.dart';
import 'package:taif/models/bank_transactions_model.dart';
import 'package:taif/models/package_model.dart';
import 'package:taif/models/request_package_model.dart';
import 'package:taif/models/user_data_model.dart';
import 'package:taif/screens/primary_screens/membership_screen/cubit/state.dart';


class PackagesCubit extends Cubit<PackagesState> {
  PackagesCubit() : super(PackagesInitState());

  static PackagesCubit get(context) => BlocProvider.of(context);
  PackageModel packageModel = PackageModel();
  RequestPackageModel requestPackageModel = RequestPackageModel();
  BankTransactionsModel bankTransactionsModel = BankTransactionsModel();
  UserDataModel userDataModel = UserDataModel();


  void getPackages() {
    emit(PackagesLoadingState());
    DioHelper.init();
    DioHelper.getData(url: PACKAGES).then((value) {
      if (value.statusCode == 200) {
        print('packages');
        packageModel = PackageModel.fromJson(value.data);
      }
      emit(PackagesSuccessState());
    }).catchError((e) {
      print('packages error ');
      emit(PackagesErrorState());
    });
  }



  void getUserData() {

    DioHelper.init();
    DioHelper.getData(url: 'users/${AppController.instance.getId()}')
        .then((value) {
      print('i am here estate ');
      print('user id ${AppController.instance.getId()}');
      if (value.statusCode == 200) {
        print('here profile estate');
        userDataModel = UserDataModel.fromJson(value.data);
      }


    }).catchError((e) {
      print('userData error estate  $e');

    });
  }

  void requestPackage({
    required int id,
  }) {
    emit(RequestPackagesLoadingState());
    DioHelper.init();
    DioHelper.postData(url: REQUEST_PACKAGES, data: {
      'user_id': AppController.instance.getId(),
      'package_id': id,
    }).then((value) {
      if (value.statusCode == 200) {
        print('request packages');
        requestPackageModel = RequestPackageModel.fromJson(value.data);
      }
      emit(RequestPackagesSuccessState());
    }).catchError((e) {
      print('request packages error $e');
      emit(RequestPackagesErrorState());
    });
  }

   Future<void> bankTransactions({
     required int subscriptionId,
     required String name,
     required String accountNumber,
     required String date,
     required String amount,
     required File image,
   }) async {
     emit(BankTransactionsLoadingState());
     String fileName = '';
       fileName =image.path.split('/').last;
     DioHelper.init();
     var formData = FormData.fromMap({
       'user_id': AppController.instance.getId(),
       'subscription_id': subscriptionId,
       "image":
       await MultipartFile.fromFile(image.path, filename:fileName),
       'account_name': name,
       'account_number': accountNumber,
       'bank_name': 'alrajhi',
       'date': date,
       'amount': amount,
     });
     DioHelper.postData(url: BANK_TRANSACTIONS, data:formData).then((value) {
       if (value.statusCode == 200) {
         print('bank transactions done');
         print('$value');
        bankTransactionsModel = BankTransactionsModel.fromJson(value.data);
      }
       emit(BankTransactionsSuccessState());
     }).catchError((e) {
       print('bank transactions done error $e');
      emit(BankTransactionsErrorState());
    });
   }

  File? bankImage;
  var picker = ImagePicker();

  Future<void> getImage() async {
    final pickerFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickerFile != null) {
      bankImage = File(pickerFile.path);
      emit(GetImagePackageSuccessState());
    } else {
      print('No Image Selected');
      emit(GetImagePackageErrorState());
    }
  }

//   Future<int> uploadImage({
//     required int subscriptionId,
//     required String name,
//     required String accountNumber,
//     required String date,
//     required String amount,
// })async{
//     var length = await bankImage!.length();
//     // test(subscriptionId: subscriptionId, name: name, accountNumber: accountNumber, date: date, amount: amount,length: length);
//     emit(LengthState());
//     print('length $length');
//     return length;
//   }

// Future upload()async{
//     String imageName = bankImage!.path.split('/').last;
//     var fileStream = new http.ByteStream(DelegatingStream.typed(bankImage!.openRead()));
//     var length = await bankImage!.length();
//     var url = 'https://opencart3.const-tech.biz/tf/api/bank_transactions';
//     var data = {
//       'user_id':4,
//       'subscription_id':1,
//       'account_name':'s',
//       'account_number':'123',
//       'bank_name':'s',
//       'date':'8-8-2021',
//       'amount':'123'
//     };
//     var request = await http.(Uri.parse(url),body: data);
//     var multipartFile = new http.MultipartFile('file', fileStream, length,
//         filename:bankImage;
//     request.files.add(multipartFile);
// }



}
