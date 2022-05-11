import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:smart_railway/models/train_model.dart';

class SensorsApi {
  Future<TrainModel> getTrainsById(int id) async {
    TrainModel trainModel;
    var response = await http.get(
      Uri.parse('http://c4ea-156-218-102-7.ngrok.io/allTrains/$id'),
    );
    var jsonResponse = convert.jsonDecode(response.body);

    trainModel = TrainModel.fromJson(jsonResponse);
    return trainModel;
  }
}
