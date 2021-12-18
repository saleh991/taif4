
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/data_districts.dart';
import 'package:http/http.dart' as http;

abstract class DistrictsRepostory{

  Future<DataDistricts> getAllDistricts();
// Future<PackageModel> getAllDataOffer(int paj);

}

class DistrictsImpl extends DistrictsRepostory{

  @override
  Future<DataDistricts> getAllDistricts() async{
    // final encoding = Encoding.getByName('utf-8');
    // String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};


    var response = await http.get(
      Uri.parse(URLAPP+"estate/assets"),
      // body:jsonBody,
      // encoding: encoding,
      headers: headers,
    );

    debugPrint(URLAPP+"estate/assets");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body.toString());
    try {
      if (response.statusCode == 200) {
        DataDistricts dataMyOrder = DataDistricts.fromJson(json.decode(response.body));
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

