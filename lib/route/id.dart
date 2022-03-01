import 'package:flutter/material.dart';

class Id extends StatelessWidget {
  final List<String> entries = [
    'ID:123456789125                                                Normal',
    'ID:123456789125                                                Normal',
    'ID:123456789125                                                Normal',
    'ID:123456789125                                                Warning',
    'ID:123456789125                                                Normal',
    'ID:123456789125                                                Warning',
    'ID:123456789125                                                Normal',
    'ID:123456789125                                                Normal'
  ];
  final List<int> colorcodes = [
    100,
    200,
    300,
    500,
    600,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('smart railway'),
      ),
      body: ListView.separated(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Container(
              margin: const EdgeInsets.all(50.0),
              height: 50,
              width: 100,
              color: Colors.grey[300],
              child: Text(
                entries[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, "/sensor");
            },
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}
