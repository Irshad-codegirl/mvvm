import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm/data/app_exception.dart';
import 'package:mvvm/data/network/baseApiService.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responsejson;
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: 20));
      responsejson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('NO Internet connection');
    }
    return responsejson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responsejson;
    try {
      http.Response response = await http
          .post(
            Uri.parse(url),
            headers: {'x-api-key': ' reqres-free-v1'},
            body: data,
          )
          .timeout(Duration(seconds: 20));

      responsejson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('NO Internet connection');
    }
    return responsejson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsejson = jsonDecode(response.body);
        return responsejson;
      case 400:
        throw BadRequiestException(response.body.toString());
      case 404:
        throw UnAuthorizedException(response.body.toString());
      default:
        throw FetchDataException(
          'Error accured while communicating with server' +
              'with status code ' +
              response.statusCode.toString(),
        );
    }
  }
}
