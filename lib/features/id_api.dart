import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

import 'package:smart_railway/models/train_model.dart';
import 'package:smart_railway/provider/domain_url_provider.dart';

class IdApi {
  final Future<SharedPreferences> _pref= SharedPreferences.getInstance();
  Future<List<TrainModel>?> gettrains(BuildContext context) async {
    final SharedPreferences pref = await _pref;

    List<TrainModel> trains = [];
    DomainUrlProvider provider = Provider.of<DomainUrlProvider>(context);
    String baseURL = provider.url;
    if (kDebugMode) {
      print("trians:::::$baseURL");
    }
    var response = await http.get(Uri.parse('$baseURL/api/all_trains'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${pref.getString("token")}'
    });
    var jsonResponse = convert.jsonDecode(response.body);
    for (var c in jsonResponse) {
      trains.add(TrainModel.fromJson(c));
    }
    return trains;
  }
}
