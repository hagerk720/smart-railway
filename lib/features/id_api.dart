import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:smart_railway/models/train_model.dart';

class IdApi {
  Future<List<TrainModel>?> gettrains() async {
    List<TrainModel> trains = [];
    print("gettrains");
    var response = await http.get(
      Uri.parse('http://c4ea-156-218-102-7.ngrok.io/allTrains'),
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
