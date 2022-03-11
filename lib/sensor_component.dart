import 'package:flutter/material.dart';

class sensor_component extends StatelessWidget {
  final String? imgURL;
  final String? sensorName;
  final String? sensorData;
  sensor_component({this.sensorData, this.sensorName, this.imgURL});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(imgURL!),
          ),
          Text(
            sensorName!,
            style: TextStyle(color: Colors.blue[400], fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(sensorData.toString()),
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
}
