import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert' as convert;

import 'package:smart_railway/models/train_model.dart';

import '../provider/domain_url_provider.dart';

class SensorsApi {
  Future<TrainModel> getTrainsById(int id,BuildContext context) async {
    DomainUrlProvider provider = Provider.of<DomainUrlProvider>(context);
    String baseURL = provider.url;
    TrainModel trainModel;
    var response = await http.get(
      Uri.parse('$baseURL/allTrains/$id'),
    );
    var jsonResponse = convert.jsonDecode(response.body);

    trainModel = TrainModel.fromJson(jsonResponse);
    return trainModel;
  }
}
