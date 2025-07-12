import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/utilis/routes_name.dart';
import 'package:mvvm/view_model/user_view_model.dart';

class SplashService {
  Future<UserModel> getUserData() => UserViewModel().getUser();
  void checkAuthentication(BuildContext context) async {
    getUserData()
        .then((value) async {
          print(value.token);
          if (value.token == 'null' || value.token == '') {
            await Future.delayed(Duration(seconds: 3));
            Navigator.pushNamed(context, RoutesName.login);
          } else {
            await Future.delayed(Duration(seconds: 3));
            Navigator.pushNamed(context, RoutesName.home);
          }
        })
        .onError((error, stackTrace) {
          if (kDebugMode) {
            print(error.toString());
          }
        });
  }
}
