import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_railway/provider/domain_url_provider.dart';
import 'package:smart_railway/route/home.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  TextEditingController domainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DomainUrlProvider provider  = Provider.of<DomainUrlProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,

          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: domainController,
                style: TextStyle(color: Colors.black,fontSize: 18),
                onEditingComplete: (){
                  provider.changeUrl(domainController.text);
                  Navigator.push(context,MaterialPageRoute(builder: (_)=>const Home()));
                },
                decoration: InputDecoration(
                  hintText: 'Domain url',
                  hintStyle: TextStyle(color: Colors.grey),

                ),

              ),
            ),
          ),
        ),
      ),
    );
  }
}
