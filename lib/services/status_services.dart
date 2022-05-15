import 'dart:convert';

import 'package:flutter_covid/models/world_status_model.dart';
import 'package:flutter_covid/services/utilities/apps_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStatusModel> getWorldStatusRecord() async {
    final response = await http.get(Uri.parse(Appurl.worldStateApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return WorldStatusModel.fromJson(data);
    } else {
      throw Exception("error");
    }
  }

  Future<List<dynamic>> getCountriesListRecord() async {
    final response = await http.get(Uri.parse(Appurl.countriesList));
    var data;
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception("error");
    }
  }
}
