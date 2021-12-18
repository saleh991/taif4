
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:taif/controller/app_controller.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/notification_model.dart';
import 'package:taif/models/package_model.dart';

abstract class NotoficationReposotory{

  Future<NotificationModel> getAllDataNotifcaton();
  Future<dynamic> deleteItemNotification(int id);

}

class NotoficationReposotoryImpl extends NotoficationReposotory{

  @override
  Future<NotificationModel> getAllDataNotifcaton() async{

    // Map body={"lang": "en", "userid": 65, "offer_id": 104, "locationid": null, "cat_id": null, "trending_id": null};
    // final encoding = Encoding.getByName('utf-8');
    // String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(URLAPP+'notifications?user_id=${AppController.instance.getId()}'),
      // body:jsonBody,
      // encoding: encoding,
      headers: headers,
    );

    debugPrint(" in first Catch>>>>>>>>>>>>");
    debugPrint(response.statusCode.toString());
    try {
      if (response.statusCode == 200) {

        NotificationModel dataMyOrder = NotificationModel.fromJson(json.decode(response.body));
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
  Future<dynamic> deleteItemNotification(int id) async{

    // Map body={"lang": "en", "userid": 65, "offer_id": 104, "locationid": null, "cat_id": null, "trending_id": null};
    final encoding = Encoding.getByName('utf-8');
    // String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};

    var response = await http.delete(
      Uri.parse(URLAPP+"notifications/$id"),
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

}


