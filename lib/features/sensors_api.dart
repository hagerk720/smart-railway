import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

import 'package:smart_railway/models/train_model.dart';

import '../provider/domain_url_provider.dart';

class SensorsApi {
    final Future<SharedPreferences> _pref= SharedPreferences.getInstance();

  Future<TrainModel> getTrainsById(int id,BuildContext context) async {
        final SharedPreferences pref = await _pref;

    DomainUrlProvider provider = Provider.of<DomainUrlProvider>(context);
    String baseURL = provider.url;
    TrainModel trainModel;
    var response = await http.get(
      Uri.parse('$baseURL/api/all_trains/$id'),
      headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${pref.getString("token")}'
    }
    );
    var jsonResponse = convert.jsonDecode(response.body);

    trainModel = TrainModel.fromJson(jsonResponse);
    return trainModel;
  }
}
