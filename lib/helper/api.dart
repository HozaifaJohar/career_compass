import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer$token'});
    }

    http.Response response = await http.get(Uri.parse(url), headers: headers);
    // print('ddddddddddd');
    print(response.statusCode);
    // print('ddddddddddd');
    if (response.statusCode == 200 || response.statusCode == 201) {
      // print('ddddddddddd');
      // print(jsonDecode(response.body));
      // print('ddddddddddd');
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer$token'});
    }

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      var data = jsonDecode(response.body);
      print('///${data}///');
      return data;
    } else if (response.statusCode == 403) {
      print(response.statusCode);
      var data = jsonDecode(response.body);
      print('///${data}///');
      return;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
      // when you throw respose.body it will show if there something required in the body of the api...
    }
  }

  Future<dynamic> put({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll(
      {'Content-Type': 'application/x-www-form-urlencoded'},
    );

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer$token'});
    }

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
      // when you throw respose.body it will show if there something required in the body of the api...
    }
  }
}
