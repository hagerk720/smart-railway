import 'package:flutter/material.dart';
import 'package:smart_railway/features/id_api.dart';
import 'package:smart_railway/models/train_model.dart';

enum IdState { initial, loading, loaded, error }

class IdProvider with ChangeNotifier {
  IdState state = IdState.initial;
  List<TrainModel>? trains; 
  gettrains(BuildContext context) async {
    trains = await IdApi().gettrains(context);
     if (trains != null) {
      state = IdState.loaded;
    } else {
      state = IdState.error;
    }
    notifyListeners();
  }

  IdApi idApi = IdApi();
  
}

