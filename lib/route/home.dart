import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_railway/provider/login_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final LoginProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Image(
              image: AssetImage("assets/images/img.png"),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Welcome Back",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            Row(
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
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your username',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 5),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your password',
                ),
              ),
            ),
            SizedBox(
              width: 350,
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  // if (provider.state == loginState.initial) {
                  //   provider.login("userName", "password");
                  // }
                  // else if(provider.state == loginState.loaded){
                  //   Navigator.pushNamed(context, "/id");
                  // }
                  Navigator.pushNamed(context, "/id");
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    backgroundColor:
                        (MaterialStateProperty.all<Color>(Colors.blue))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
