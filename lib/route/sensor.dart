import 'package:flutter/material.dart';

import '../sensor_component.dart';

class Sensor extends StatefulWidget {
  const Sensor({Key? key}) : super(key: key);

  @override
  _SensorState createState() => _SensorState();
}

class _SensorState extends State<Sensor> {
  var sensorData = {
    "speed": "200 km/hr",
    "lighting": "on",
    "Humdidty": "30",
    "DoorsState": "open",
    "Location": "url",
    "Alarms": "non",
    "ID": "123452588"
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Smart',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[600]),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Railway',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[500]),
            ),
          ],
        ),
      ),
      body: GridView.count(
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
          top: 20,
        ),
        crossAxisCount: 2,
        crossAxisSpacing: 40,
        mainAxisSpacing: 20,
        children: [
          sensor_component(
            sensorData: sensorData["speed"],
            sensorName: "speed",
            imgURL: "assets/images/Group.png",
          ),
          sensor_component(
            sensorData: sensorData["Humdidty"],
            sensorName: "Humidty",
            imgURL: "assets/images/humidty.png",
          ),
          sensor_component(
            sensorData: sensorData["DoorsState"],
            sensorName: "Doors state",
            imgURL: "assets/images/door.png",
          ),
          sensor_component(
            sensorData: sensorData["Location"],
            sensorName: "Location",
            imgURL: "assets/images/Group.png",
          ),
          sensor_component(
            sensorData: sensorData["Alarms"],
            sensorName: "Alarms",
            imgURL: "assets/images/alarm.png",
          ),
        ],
      ),
    );
  }
}
