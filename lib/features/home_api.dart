import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomeApi {
  Future<String> login(String userName, String password) async {
    print("login");
    var response = await http.post(
      Uri.parse('http://245e-156-218-102-7.ngrok.io'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(
          <String, String>{'userName': userName, 'password': password}),
    );

    return response.body; 
  }
}
