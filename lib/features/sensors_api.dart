import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:smart_railway/models/train_model.dart';

class SensorsApi {
  Future<TrainModel> getTrainsById(int id) async {
    TrainModel trainModel;
    var response = await http.get(
      Uri.parse('http://8a7d-2c0f-fc88-43-bffc-2108-800a-5171-322c.ngrok.io/allTrains/$id'),
    );
    var jsonResponse = convert.jsonDecode(response.body);

    trainModel = TrainModel.fromJson(jsonResponse);
    return trainModel;
  }
}
