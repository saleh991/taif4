
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:taif/models/estate_model.dart';
import 'package:taif/models/package_model.dart';

abstract class EstatesRepostory{

  Future<EstateModel> getAllEstate(String url);
// Future<PackageModel> getAllDataOffer(int paj);

}

class EstatesRepostoryImpl extends EstatesRepostory{

  @override
  Future<EstateModel> getAllEstate(String url) async{
    Map body={"lang": "en", "userid": 65, "offer_id": 104, "locationid": null, "cat_id": null, "trending_id": null};
    final encoding = Encoding.getByName('utf-8');
    String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};


    var response = await http.get(
      Uri.parse(url),
      // body:jsonBody,
      // encoding: encoding,
      headers: headers,
    );

    debugPrint(url);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body.toString());
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

}

