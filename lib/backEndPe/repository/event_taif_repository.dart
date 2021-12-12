
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:taif/helper/constants.dart';
import 'package:taif/models/event_model.dart';
import 'package:taif/models/package_model.dart';

abstract class EventTaifRepository{

  Future<EventModel> getAllEventTaif();
  // Future<PackageModel> getAllDataOffer(int paj);

}

class EventTaifRepositoryImpl extends EventTaifRepository{

  @override
  Future<EventModel> getAllEventTaif() async{
    final headers = {'Content-Type': 'application/json'};
    var response = await http.get(
      Uri.parse(URLAPP+"posts?tag_id=2"),
      // body:jsonBody,
      // encoding: encoding,
      headers: headers,
    );

    debugPrint(URLAPP+"posts?tag_id=2");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body.toString());
    try {
      if (response.statusCode == 200) {
        EventModel dataMyOrder = EventModel.fromJson(json.decode(response.body));
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


