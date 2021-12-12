
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/DataHeraj.dart';
import 'package:taif/models/data_catigry_and_sup_in_heraj.dart';
import 'package:http/http.dart' as http;

class Api {


  static Future<DataCatigryAndSupInHeraj?> getSection() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var tokens = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $tokens'
      // 'X-localization': intl.Intl.defaultLocale??"en"
    };


    // final encoding = Encoding.getByName('utf-8');
    // String jsonBody = json.encode(body);
    var response = await http.get(
      Uri.parse(URLAPP+"haraj-categories"),
      // body: jsonBody,
      // encoding: encoding,
      headers: headers,
    );

    // debugPrint(URLAPP+"haraj-categories");
    // debugPrint(response.body.toString());
    // debugPrint(response.statusCode.toString());

    try {
      if (response.statusCode == 200) {
        DataCatigryAndSupInHeraj dataMyOrder = DataCatigryAndSupInHeraj.fromJson(
            json.decode(response.body));


        return dataMyOrder;
      } else {
        throw "error fetch data";
      }
    } catch (e) {
      debugPrint(e.toString());
      throw "error fetch data";
    }
  }


  static Future<DataHeraj?> getDataHeraje(body) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var tokens = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $tokens'
      // 'X-localization': intl.Intl.defaultLocale??"en"
    };
    debugPrint(body.toString());

    final encoding = Encoding.getByName('utf-8');
    String jsonBody = json.encode(body);
    var response = await http.get(
      Uri.parse(URLAPP+"harajs"+body),
      // body: jsonBody,
      // encoding: encoding,
      // headers: headers,
    );

    debugPrint(URLAPP+"harajs");
    debugPrint(response.body.toString());
    debugPrint(response.statusCode.toString());

    try {
      if (response.statusCode == 200) {
        DataHeraj dataMyOrder = DataHeraj.fromJson(
            json.decode(response.body));


        return dataMyOrder;
      } else {
        throw "error fetch data";
      }
    } catch (e) {
      debugPrint(e.toString());
      throw "error fetch data";
    }
  }





  static Future<dynamic?> addServices(body) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var tokens = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $tokens'
      // 'X-localization': intl.Intl.defaultLocale??"en"
    };
    debugPrint(body.toString());

    final encoding = Encoding.getByName('utf-8');
    String jsonBody = json.encode(body);
    var response = await http.post(
      Uri.parse(URLAPP+"home_services"),
      body: jsonBody,
      encoding: encoding,
      headers: headers,
    );

    debugPrint(URLAPP+"home_services");
    debugPrint(response.body.toString());
    debugPrint(response.statusCode.toString());

    try {
      if (response.statusCode == 200) {
        // DataHeraj dataMyOrder = DataHeraj.fromJson(
        //     json.decode(response.body));

        Map data=json.decode(response.body);
        print(data["status"]);

        return  data["status"];
      } else {
        throw "error fetch data";
      }
    } catch (e) {
      debugPrint(e.toString());
      throw "error fetch data";
    }
  }



}