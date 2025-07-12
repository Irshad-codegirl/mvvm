import 'package:mvvm/data/network/baseApiService.dart';
import 'package:mvvm/data/network/networkApiService.dart';
import 'package:mvvm/model/movies_model.dart';
import 'package:mvvm/resources/component/appUrls.dart';

class HomeRepository {
  BaseApiService _apiService = NetworkApiService();

  Future<MoviesListModel> fetchMoviesListApi() async {
    try {
      dynamic response = await _apiService.getGetApiResponse(
        AppUrls.moviesListEndPoint,
      );
      return response = MoviesListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
