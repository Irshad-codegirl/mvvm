import 'package:mvvm/data/network/baseApiService.dart';
import 'package:mvvm/data/network/networkApiService.dart';
import 'package:mvvm/resources/component/appUrls.dart';

class AuthRepository {
  BaseApiService _apiService = NetworkApiService();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiService.getPostApiResponse(
        AppUrls.loginUrl,
        data,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response = await _apiService.getPostApiResponse(
        AppUrls.registerUrl,
        data,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }
}
