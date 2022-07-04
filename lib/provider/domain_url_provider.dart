import 'package:flutter/material.dart';

class DomainUrlProvider extends ChangeNotifier{
  String url = '';

  changeUrl(String newUrl){
    url = newUrl;
    notifyListeners();
  }

}