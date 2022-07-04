import 'package:flutter/material.dart';
import 'package:smart_railway/features/home_api.dart';

enum loginState { initial, loading, loaded, error }

class LoginProvider with ChangeNotifier {
  loginState state = loginState.initial;
  HomeApi homeApi = HomeApi();
 void login(String userName, String password,BuildContext context) async {
    String msg = await homeApi.login(userName, password,context);
    if (msg != null) {
      state = loginState.loaded;
    } else {
      state = loginState.error;
    }
    notifyListeners();
  }
}
