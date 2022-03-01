import 'package:flutter/material.dart';

var sensorData = {
  "speed": "200 km/hr",
  "lighting": "on",
  "Humdidty": "30",
  "DoorsState": "open",
  "Location": "url",
  "Alarms": "non",
  "ID": "123452588"
};

class Sensor extends StatefulWidget {
  const Sensor({Key? key}) : super(key: key);

  @override
  _SensorState createState() => _SensorState();
}

class _SensorState extends State<Sensor> {
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
          sensor_component(context, "assets/images/Group.png", "speed"),
          sensor_component(context, "assets/images/Vector.png", "lighting"),
          sensor_component(context, "assets/images/humidty.png", "Humidty"),
          sensor_component(context, "assets/images/door.png", "Doors state"),
          sensor_component(context, "assets/images/location.png", "Location"),
          sensor_component(context, "assets/images/alarm.png", "Alarms"),
        ],
      ),
    );
  }
}

Widget sensor_component(
    BuildContext context, String imgURL, String sensorName) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(imgURL),
        ),
        Text(
          sensorName,
          style: TextStyle(color: Colors.blue[400], fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            sensorData[sensorName].toString(),
          ),
        ),
      ],
    ),
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.all(7),
  );
}
