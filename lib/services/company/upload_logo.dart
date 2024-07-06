import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FileUploader extends ChangeNotifier {
  bool isLoading = false;
  bool get load => isLoading;
  Future<void> postFiles({
    required String url,
    required String filePath,
    required String key,
    String? token,
  }) async {
    isLoading = true;
    notifyListeners();
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.headers.addAll({'Authorization': 'Bearer $token'});
    request.files.add(await http.MultipartFile.fromPath(key, filePath));
    final response = await request.send();
    var jsonResponse = await http.Response.fromStream(response);
    if (jsonResponse.statusCode == 200 || jsonResponse.statusCode == 201) {
       isLoading = false;
    notifyListeners();
      print(response.statusCode);
      var js = jsonDecode(jsonResponse.body);
      print('///$js///');
      // Notify listeners of the change
      notifyListeners();
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(jsonResponse.body)}');
    }
  }
}
