
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:taif/backEndPe/all_Bloc/blocs/all_my_order_estate_bloc.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/DataSingleOrderState.dart';
import 'package:taif/models/estate_model.dart';
import 'package:taif/models/notification_model.dart';
import 'package:taif/models/package_model.dart';

abstract class MyOrderReposotory{

  Future<EstateModel> getAllDataMyOrder();
  Future<dynamic> deleteItemMyOrder(int id);
  Future<EstateModel> serachInMyOrder(String search);
  Future<DataSingleOrderState> singelOrderState(int id);


  Future<dynamic> updateSingelOrderState({required Map body,required int id});

}

class MyOrderReposotoryImpl extends MyOrderReposotory{

  @override
  Future<EstateModel> getAllDataMyOrder() async{

    Map body={'user_id': '${AppController.instance.getId()}'};
    final encoding = Encoding.getByName('utf-8');
    String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(URLAPP+'estates?user_id=${AppController.instance.getId()}'),
      // body:jsonBody,
      // encoding: encoding,
      headers: headers,
    );

    debugPrint(" serachInMyOrder1>>>>>>>>>>>>");
    debugPrint(" serachInMyOrder2>>>>>>>>>>>>");
    debugPrint(" serachInMyOrder3>>>>>>>>>>>>");
    debugPrint(URLAPP+'estates?user_id=${AppController.instance.getId()}');
    debugPrint(response.statusCode.toString());
    try {
      if (response.statusCode == 200) {

        EstateModel dataMyOrder = EstateModel.fromJson(json.decode(response.body));
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
  Future<EstateModel> serachInMyOrder(String search) async{

    Map body={'user_id': '${AppController.instance.getId()}'};
    final encoding = Encoding.getByName('utf-8');
    String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(URLAPP+'estates?user_idu=${AppController.instance.getId()}?search=$search'),
      // body:jsonBody,
      // encoding: encoding,
      headers: headers,
    );

    debugPrint(" in first Catch1>>>>>>>>>>>>");
    debugPrint(" in first Catch2>>>>>>>>>>>>");
    debugPrint(" in first Catch3>>>>>>>>>>>>");
    debugPrint(jsonBody.toString());
    debugPrint(URLAPP+'estates?user_id=${AppController.instance.getId()}?search=$search');
    debugPrint(response.statusCode.toString());
    try {
      if (response.statusCode == 200) {

        EstateModel dataMyOrder = EstateModel.fromJson(json.decode(response.body));
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
  Future<dynamic> deleteItemMyOrder(int id) async{

    // Map body={"lang": "en", "userid": 65, "offer_id": 104, "locationid": null, "cat_id": null, "trending_id": null};
    final encoding = Encoding.getByName('utf-8');
    // String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};

    var response = await http.delete(
      Uri.parse(URLAPP+"estates/$id"),
      // body:jsonBody,
      encoding: encoding,
      headers: headers,
    );
    debugPrint(URLAPP+"notifications/$id");
    debugPrint(" <<<<<<<<<<<<<<<<in first Catch>>>>>>>>>>>>");
    debugPrint(" <<<<<<<<<<<<<<<<in first Catch>>>>>>>>>>>>");
    debugPrint(" <<<<<<<<<<<<<<<<in first Catch>>>>>>>>>>>>");
    debugPrint(response.statusCode.toString());
    try {
      if (response.statusCode == 200) {

        // NotificationModel dataMyOrder = NotificationModel.fromJson(json.decode(response.body));
        return "dataMyOrder";
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
  Future<DataSingleOrderState> singelOrderState(int id) async{

    Map body={'user_id': '${AppController.instance.getId()}'};
    final encoding = Encoding.getByName('utf-8');
    String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(URLAPP+'estates/$id'),
      // body:jsonBody,
      // encoding: encoding,
      headers: headers,
    );

    debugPrint(" in first Catch1>>>>>>>>>>>>");
    debugPrint(" in first Catch2>>>>>>>>>>>>");
    debugPrint(" in first Catch3>>>>>>>>>>>>");
    debugPrint(jsonBody.toString());
    debugPrint(URLAPP+'estates/$id');
    debugPrint(response.statusCode.toString());
    try {
      if (response.statusCode == 200) {

        DataSingleOrderState dataMyOrder = DataSingleOrderState.fromJson(json.decode(response.body));
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
  Future<dynamic> updateSingelOrderState({required Map body,required int id}) async{

    // Map body={'user_id': '${AppController.instance.getId()}'};
    final encoding = Encoding.getByName('utf-8');
    String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};

    var response = await http.post(
      Uri.parse(URLAPP+'estates/$id'),
      body:jsonBody,
      encoding: encoding,
      headers: headers,
    );

    debugPrint(" in first Catch1>>>>>>>>>>>>");
    debugPrint(" in first Catch2>>>>>>>>>>>>");
    debugPrint(" in first Catch3>>>>>>>>>>>>");
    debugPrint(jsonBody.toString());
    debugPrint(URLAPP+'estates/$id');
    debugPrint(response.statusCode.toString());
    try {
      if (response.statusCode == 200) {

        // DataSingleOrderState dataMyOrder = DataSingleOrderState.fromJson(json.decode(response.body));
        return true;
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


