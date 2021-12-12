
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/DataCarTourism.dart';
import 'package:taif/models/DataTourismList.dart';
import 'package:taif/models/data_districts.dart';
import 'package:http/http.dart' as http;

abstract class TourismRepostory{

  Future<DataCarTourism> getAllCarTourism();

  Future<DataTourismList> getAllTourism(String paj);

}

class TourismRepostoryImpl extends TourismRepostory{

  @override
  Future<DataCarTourism> getAllCarTourism() async{
    // final encoding = Encoding.getByName('utf-8');
    // String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};


    var response = await http.get(
      Uri.parse(URLAPP+"location_service_categories"),
      // body:jsonBody,
      // encoding: encoding,
      headers: headers,
    );

    debugPrint(URLAPP+"estate/assets");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body.toString());
    try {
      if (response.statusCode == 200) {
        DataCarTourism dataMyOrder = DataCarTourism.fromJson(json.decode(response.body));
        return dataMyOrder;
      }else {
        throw "error fetch data1";
      }
    }
    catch(e){
      debugPrint(" in first Catch>>>>>>>>>>>>"+response.body.toString());
      throw "error fetch data";
    }
  }



  @override
  Future<DataTourismList> getAllTourism(String paj) async{
    // final encoding = Encoding.getByName('utf-8');
    // String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};


    var response = await http.get(
      Uri.parse(URLAPP+"location_services?location_service_category_id=$paj"),
      // body:jsonBody,
      // encoding: encoding,
      headers: headers,
    );

    debugPrint(URLAPP+"location_services?location_service_category_id=$paj");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body.toString());
    try {
      if (response.statusCode == 200) {
        DataTourismList dataMyOrder = DataTourismList.fromJson(json.decode(response.body));
        return dataMyOrder;
      }else {
        throw "error fetch data1";
      }
    }
    catch(e){
      debugPrint(" in first Catch>>>>>>>>>>>>"+response.body.toString());
      throw "error fetch data";
    }
  }

}

