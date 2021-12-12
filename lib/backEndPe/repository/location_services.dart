
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:taif/helper/constants.dart';
import 'package:taif/models/data_singel_heraje.dart';
import 'package:taif/models/data_singel_locaton_service.dart';
import 'package:taif/models/estate_model.dart';
import 'package:taif/models/package_model.dart';

abstract class LocationServicesRepostory{

  Future<DataSingelLocationService> getAllLocationServices(String id);
// Future<PackageModel> getAllDataOffer(int paj);

}

class LocationServicesRepostoryImpl extends LocationServicesRepostory{

  @override
  Future<DataSingelLocationService> getAllLocationServices(String id) async{
    Map body={"lang": "en", "userid": 65, "offer_id": 104, "locationid": null, "cat_id": null, "trending_id": null};
    final encoding = Encoding.getByName('utf-8');
    String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};


    var response = await http.get(
      Uri.parse(URLAPP+"location_services/"+id),
      // body:jsonBody,
      // encoding: encoding,
      headers: headers,
    );

    debugPrint(URLAPP+"location_services/"+id);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body.toString());
    try {
      if (response.statusCode == 200) {
        DataSingelLocationService dataMyOrder = DataSingelLocationService.fromJson(json.decode(response.body));
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

