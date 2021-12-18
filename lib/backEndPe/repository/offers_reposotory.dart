
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/data_districts.dart';
import 'package:http/http.dart' as http;
import 'package:taif/models/offers_model.dart';
import 'package:taif/models/taif_model.dart';

abstract class OffersRepostory{

  Future<OffersModel> getAllOffers();

}

class OffersRepostoryImpl extends OffersRepostory{

  @override
  Future<OffersModel> getAllOffers() async{
    // final encoding = Encoding.getByName('utf-8');
    // String jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};


    var response = await http.get(
      Uri.parse(URLAPP+"posts?tag_id=3"),
      // body:jsonBody,
      // encoding: encoding,
      headers: headers,
    );

    debugPrint(URLAPP+"estate/assets");
    debugPrint(response.statusCode.toString());
    debugPrint(response.body.toString());
    try {
      if (response.statusCode == 200) {
        OffersModel dataMyOrder = OffersModel.fromJson(json.decode(response.body));
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

