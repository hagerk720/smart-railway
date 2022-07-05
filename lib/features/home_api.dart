import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomeApi {
  Future<String> login(String userName, String password) async {
    print("login");
    var response = await http.post(
      Uri.parse('http://1c3c-84-233-49-8.ngrok.io'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(
          <String, String>{'userName': userName, 'password': password}),
    );

    return response.body; 
  }
}
