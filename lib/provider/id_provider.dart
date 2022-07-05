import 'package:flutter/material.dart';
import 'package:smart_railway/features/id_api.dart';
import 'package:smart_railway/models/train_model.dart';

enum IdState { initial, loading, loaded, error }

class IdProvider with ChangeNotifier {
  IdState state = IdState.initial;
  IdApi idApi = IdApi();
  List<TrainModel>? trains;
  gettrains() async {
    trains = await idApi.gettrains();
    print(trains);
    if (trains != null) {
      state = IdState.loaded;
    } else {
      state = IdState.error;
    }

    notifyListeners();
  }

  //IdApi idApi = IdApi();
}

class _IdState {}
