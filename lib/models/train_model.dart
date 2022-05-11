class TrainModel {
  final int? id;
  final Sensors? sensors;
  final bool? alarm;
  TrainModel({
    this.id,
    this.sensors,
    this.alarm,
  });
  factory TrainModel.fromJson(Map<String, dynamic> json) {
    TrainModel train = TrainModel(
        id: json["id"],
        sensors: Sensors.fromJson(json["sensors"]),
        alarm: json["alarm"]);
    return train;
  }
}

class Sensors {
  final double? speed;
  final double? temp;
  final String? gps;
  final String? lightState;
  final String? doorState;
  final double? humidity;
  Sensors({
    this.speed,
    this.temp,
    this.gps,
    this.lightState,
    this.doorState,
    this.humidity,
  });
  factory Sensors.fromJson(Map<String, dynamic> json) {
    Sensors sensors = Sensors(
      speed: json["speed"],
      temp: json["temp"],
      gps: json["GPS"],
      lightState: json["lightState"],
      doorState: json["doorState"],
      humidity: json["humidity"],
    );
    return sensors;
  }
}
