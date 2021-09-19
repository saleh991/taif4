import 'package:path/path.dart';
import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:taif/helper/constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'lang': 'ar',
        },
        baseUrl: URL,
        receiveDataWhenStatusError: true,

      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required var data,
    Map<String, dynamic>? query,
    String token = '',
  }) async {


    return await dio.post(
      url,
      data: data,

      queryParameters: query,
    );
  }



  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String token = '',
  }) async {
    return await dio.put(
      url,
      data: data,
      options: Options(
        headers: {
          'Authorization': token,
        },
      ),
      queryParameters: query,
    );
  }

//   static Future<Response> sendForm({
//     required String url,
//     required Map<String, dynamic> data,
//     required Map<String, File> files,
//   }) async {
//     Map<String, MultipartFile> fileMap = {};
//     for (MapEntry fileEntry in files.entries) {
//       File file = fileEntry.value;
//       String fileName = basename(file.path);
//       fileMap['image'] = MultipartFile(file.openRead(), await file.length(),
//           filename: fileName);
//
//     // data.files.addAll(fileMap);
//     var formData = FormData.fromMap(data);
//     print('${formData.fields}');
//     return await dio.post(url,
//         data: formData,
//         options: Options(headers: {
//           'Content-Type':
//               'multipart/form-data; boundary=<calculated when request is sent>',
//         }));
//   }



}
