import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/repository/auth_repo.dart';
import 'package:mvvm/utilis/routes_name.dart';
import 'package:mvvm/utilis/utils.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  bool _signUploading = false;
  bool get signUploading => _signUploading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setsignUpLoading(bool value) {
    _signUploading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo
        .loginApi(data)
        .then((value) {
          setLoading(false);
          final userPreference = Provider.of<UserViewModel>(
            context,
            listen: false,
          );
          userPreference.saveUser(UserModel(token: value['token'].toString()));
          Utils.flushBarErrorMessage('Login Successfully', context);
          Navigator.pushNamed(context, RoutesName.home);
          if (kDebugMode) {
            print(value.toString());
          }
        })
        .onError((error, stackTrace) {
          setLoading(false);
          if (kDebugMode) {
            Utils.flushBarErrorMessage(error.toString(), context);
            print(error.toString());
          }
        });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setsignUpLoading(true);
    _myRepo
        .signUpApi(data)
        .then((value) {
          setsignUpLoading(false);
          if (kDebugMode) {
            Utils.flushBarErrorMessage('SignUP Successfully', context);
            Navigator.pushNamed(context, RoutesName.home);
            print(value.toString());
          }
        })
        .onError((error, stackTrace) {
          setsignUpLoading(false);
          if (kDebugMode) {
            Utils.flushBarErrorMessage(error.toString(), context);
            print(error.toString());
          }
        });
  }
}
