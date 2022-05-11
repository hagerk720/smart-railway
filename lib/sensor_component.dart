import 'package:flutter/material.dart';

class SensorComponent extends StatelessWidget {
  final String? imgURL;
  final String? sensorName;
  final dynamic sensorData;
  const SensorComponent( {Key? key, this.sensorData, this.sensorName, this.imgURL}) : super(key: key);

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
      margin: const EdgeInsets.all(7),
    );
  }
}
