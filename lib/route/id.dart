import 'package:flutter/material.dart';

List<String> Data = [
  "123456789125",
  "123456789125",
  "123456789125",
  "123456789125",
  "123456789125"
];

class id extends StatefulWidget {
  const id({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _SensorState extends State<id> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('smart railway'),
      ),
      body: ListView.builder
      (
        itemCount: Data.length,
        itemBuilder: (BuildContext ctxt, int index){
          return Container(
      child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "ID",
          style: TextStyle(color: Colors.blue[400], fontSize: 20),
        ),
        Text(
          Data[index].toString(),
          style: TextStyle(color: Colors.blue[400], fontSize: 20),
        ),
        } 

    );
  }
}

Widget sensor_component(
    BuildContext context, String State, String ID) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          ID,
          style: TextStyle(color: Colors.blue[400], fontSize: 20),
        ),
        Text(
          State,
          style: TextStyle(color: Colors.blue[400], fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            Data[0].toString(),
          ),
        ),
      ],
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.all(7),
  );
}   ),