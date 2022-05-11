import 'package:flutter/cupertino.dart';
import 'package:smart_railway/features/sensors_api.dart';
import 'package:smart_railway/models/train_model.dart';

enum SensorsState { initial, loading, loaded, error }

class SensorsProvider with ChangeNotifier {
  SensorsState state = SensorsState.initial;
   final SensorsApi sensorsApi = SensorsApi();
  TrainModel? train;
  void getTrainDetails(int trainId) async {
    train = await sensorsApi.getTrainsById(trainId);
    if (train != null) {
      state = SensorsState.loaded;
    } else {
      state = SensorsState.error;
    }
    notifyListeners();
   
  }
}
