import 'package:dio/dio.dart';
import 'package:tmdbmovies/shared/constants.dart';
import 'package:tmdbmovies/shared/models/movie_model.dart';

var dioOptions = BaseOptions(
  baseUrl: BASE_URL,
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

class HomeRepository {
  Dio dio = new Dio(dioOptions);

  Future<List<Movie>> getPopularMovies(int page) async {
    try {
      var response = await dio.get('/movie/popular',
          queryParameters: {'api_key': API_KEY, 'page': page.toString()});
      print("response");
      print(response);
      return (response.data['results'] as List)
          .map((item) => Movie.fromJson(item))
          .toList();
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
