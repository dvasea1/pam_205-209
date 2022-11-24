import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:test_2/presentation/home/models/user.dart';
import 'package:test_2/presentation/home/models/response.dart' as modelResponse;
import 'package:test_2/resources/files.dart';

class HomeController extends GetxController {
  void readJsonFile() async {
    String jsonString = await rootBundle.loadString(Files.jsonFilePath);
    var mapResponse = jsonDecode(jsonString);

    modelResponse.Response response = modelResponse.Response.fromJson(mapResponse);
    //User user = User.fromJson(mapUser);
       print('response ${response.user.firstName}');
  }
}
