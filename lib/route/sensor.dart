import 'package:flutter/material.dart';

var sensorData = {
  "speed": "200 km/hr",
  "lighting": "on",
  "Humdidty": "30",
  "DoorsState": "open",
  "Location": "url",
  "Alarms": "non"
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
          title: Text('smart railway'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.only(
            left: 40,
            right: 40,
            top: 20,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child:
                  sensor_component(context, "assets/images/Group.png", "speed"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: sensor_component(
                  context, "assets/images/Vector.png", "lighting"),
            )
          ],
        ));
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
