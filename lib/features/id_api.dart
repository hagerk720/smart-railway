import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert' as convert;

import 'package:smart_railway/models/train_model.dart';
import 'package:smart_railway/provider/domain_url_provider.dart';

class IdApi {
  Future<List<TrainModel>?> gettrains(BuildContext context) async {
    List<TrainModel> trains = [];
    DomainUrlProvider provider = Provider.of<DomainUrlProvider>(context);
    String baseURL = provider.url;
    if(kDebugMode){

      print("trians:::::$baseURL");
    }
    var response = await http.get(
      Uri.parse('$baseURL/allTrains'),
    );
    var jsonResponse = convert.jsonDecode(response.body);
    print(jsonResponse);
    for (var c in jsonResponse) {
      print(c);
      trains.add(TrainModel.fromJson(c));
    }
    print('number of :$trains');
    return trains;
  }
}
