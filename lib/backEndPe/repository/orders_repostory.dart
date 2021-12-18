
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/DataOrderHomeservices.dart';
import 'package:taif/models/DataOrderOffers.dart';
import 'package:taif/models/DataOrderlocationServices.dart';
import 'package:taif/models/data_districts.dart';
import 'package:http/http.dart' as http;

abstract class OrderRepostory{

  // Homeservices  LocationService   OffersOrders
  Future<DataOrderHomeservices> getAllOrderHomeservices();
  Future<DataOrderlocationServices> getAllOrderLocationServices();
  Future<DataOrderOffers> getAllOrderOffersOrders();

}

class OrderRepostoryImpl extends OrderRepostory{

  @override
  Future<DataOrderHomeservices> getAllOrderHomeservices() async{
    // final encoding = Encoding.getByName('utf-8');
    // String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};


    //AppController.instance.getId()
    var response = await http.get(
      Uri.parse(URLAPP+"myAds?section=home_services&user_id=${AppController.instance.getId()}"),
      // body:jsonBody,
      // encoding: encoding,
      headers: headers,
    );

    debugPrint(URLAPP+"myAds?section=home_services&user_id=${AppController.instance.getId()}");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body.toString());
    try {
      if (response.statusCode == 200) {
        DataOrderHomeservices dataMyOrder = DataOrderHomeservices.fromJson(json.decode(response.body));
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
  Future<DataOrderlocationServices> getAllOrderLocationServices() async{
    // final encoding = Encoding.getByName('utf-8');
    // String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};


    //AppController.instance.getId()
    var response = await http.get(
      Uri.parse(URLAPP+"myAds?section=location_services&user_id=${AppController.instance.getId()}"),
      // body:jsonBody,
      // encoding: encoding,
      headers: headers,
    );

    debugPrint(URLAPP+"myAds?section=DataOrderlocationServices&user_id=${AppController.instance.getId()}");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body.toString());
    try {
      if (response.statusCode == 200) {
        DataOrderlocationServices dataMyOrder = DataOrderlocationServices.fromJson(json.decode(response.body));
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
  Future<DataOrderOffers> getAllOrderOffersOrders() async{
    // final encoding = Encoding.getByName('utf-8');
    // String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};


    //AppController.instance.getId()
    var response = await http.get(
      Uri.parse(URLAPP+"myAds?section=offers&user_id=${AppController.instance.getId()}"),
      // body:jsonBody,
      // encoding: encoding,
      headers: headers,
    );

    debugPrint(URLAPP+"myAds?section=offers&user_id=${AppController.instance.getId()}");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body.toString());
    try {
      if (response.statusCode == 200) {
        DataOrderOffers dataMyOrder = DataOrderOffers.fromJson(json.decode(response.body));
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

