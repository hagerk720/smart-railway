import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_railway/models/train_model.dart';
import 'package:smart_railway/provider/sensors_provider.dart';

import '../sensor_component.dart';

class Sensor extends StatefulWidget {
  const Sensor({Key? key}) : super(key: key);

  @override
  _SensorState createState() => _SensorState();
}

class _SensorState extends State<Sensor> {
  SensorsProvider? provider ;
  TrainModel? trainModel;
  int? trainId;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      trainId = ModalRoute.of(context)!.settings.arguments as int;
    });
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<SensorsProvider>(context);

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
            const SizedBox(
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
      body:
      StreamBuilder(
          stream: Stream.periodic(const Duration(seconds: 2), (_) {
            if(kDebugMode){
              print('stream::');

              provider!.getTrainDetails(trainId!,context);
              // if (provider!.state == SensorsState.initial) {
              //   provider!.getTrainDetails(trainId!,context);
              //   return const Center(child: CircularProgressIndicator());
              // } else if (provider!.state == SensorsState.loaded) {
              //   trainModel = provider!.train;
              //   provider!.state = SensorsState.initial;
              // }
            }
          }),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {

              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {

              return  GridView.count(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 20,
                ),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 20,
                children: [
                  SensorComponent(
                    sensorData: trainModel!.sensors!.speed,
                    sensorName: "speed",
                    imgURL: "assets/images/Group.png",
                  ),
                  SensorComponent(
                    sensorData: trainModel!.sensors!.humidity,
                    sensorName: "Humidty",
                    imgURL: "assets/images/humidty.png",
                  ),
                  SensorComponent(
                    sensorData: trainModel!.sensors!.doorState,
                    sensorName: "Doors state",
                    imgURL: "assets/images/door.png",
                  ),
                  SensorComponent(
                    sensorData: trainModel!.sensors!.gps,
                    sensorName: "Location",
                    imgURL: "assets/images/Group.png",
                  ),
                  SensorComponent(
                    sensorData: trainModel!.sensors!.temp,
                    sensorName: "Tempreture",
                    imgURL: "assets/images/alarm.png",
                  ),
                  SensorComponent(
                    sensorData: trainModel!.sensors!.lightState,
                    sensorName: "Light State",
                    imgURL: "assets/images/humidty.png",
                  ),
                ],
              );
            }else{
              return const Center(
                child:  Text('No Data found ;('),
              );
            }
          }
      )




    );
  }
}
