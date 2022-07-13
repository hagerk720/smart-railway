import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

import '../provider/domain_url_provider.dart';

class HomeApi {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  Future<String> login(
      String userName, String password, BuildContext context) async {
    DomainUrlProvider provider = Provider.of<DomainUrlProvider>(context);
    String baseURL = provider.url;

    var response = await http.post(
      Uri.parse('$baseURL/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(
          <String, String>{'userName': userName, 'password': password}),
    );
    final SharedPreferences pref = await _pref;
    pref.setString("token", response.body);
    return response.body;
  }
}
