import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_railway/models/train_model.dart';
import 'package:smart_railway/provider/id_provider.dart';

class Id extends StatefulWidget {
  @override
  State<Id> createState() => _IdState();
}

class _IdState extends State<Id> {
  List<TrainModel>? trains;
  IdProvider? provider ;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<IdProvider>(context);

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
      backgroundColor: Colors.white,
      body:
      StreamBuilder(
          stream: Stream.periodic(const Duration(seconds: 2), (_) {
            if(kDebugMode){
              print('stream::');
              provider!.gettrains(context);
              // if (provider!.state == IdState.initial) {
              //   provider!.gettrains(context);
              //   return Container(
              //     color: Colors.white,
              //   );
              // } else {
              //   trains = provider!.trains;
              //   provider!.state = IdState.initial;
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

              return  ListView.separated(
                itemCount: trains!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      margin: const EdgeInsets.all(50.0),
                      height: 50,
                      width: 100,
                      color: Colors.grey[300],
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              trains![index].id.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              trains![index].alarm == true ? "Warning" : "normal",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      print(trains![index].id);
                      Navigator.pushNamed(context, "/sensor",
                          arguments: trains![index].id);
                    },
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
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
