import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:smart_railway/models/train_model.dart';

class IdApi {
  List<TrainModel> trains = [];

  Future<List<TrainModel>?> gettrains() async {
    print("gettrains");
    var response = await http.get(
      Uri.parse(
          'http://8a7d-2c0f-fc88-43-bffc-2108-800a-5171-322c.ngrok.io/allTrains'),
    );
    var jsonResponse = convert.jsonDecode(response.body);
    //print(jsonResponse);
    for (var c in jsonResponse) {
      print(c);
      trains.add(TrainModel.fromJson(c));
    }
    print('number of :$trains');
    return trains;
  }
}
