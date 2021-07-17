import 'package:dio/dio.dart';
import 'package:tmdbmovies/shared/constants.dart';
import 'package:tmdbmovies/shared/models/genre_model.dart';
import 'package:tmdbmovies/shared/models/tvshow_details_model.dart';
import 'package:tmdbmovies/shared/models/tvshow_model.dart';

var dioOptions = BaseOptions(
  baseUrl: BASE_URL,
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

class TvshowRepository {
  Dio dio = new Dio(dioOptions);

  Future<List<Genre>> getTvshowGenres() async {
    var response = await dio.get('/genre/tv/list',
        queryParameters: {'api_key': API_KEY, 'language': 'pt-BR'});

    return (response.data['genres'] as List)
        .map((item) => Genre.fromJson(item))
        .toList();
  }

  Future<TvshowDetails> getTvshowById(int id) async {
    var response = await dio.get('/tv/$id',
        queryParameters: {'api_key': API_KEY, 'language': 'pt-BR'});
    return TvshowDetails.fromJson(response.data);
  }

  Future<List<Tvshow>> getPopularTvshows(int page) async {
    var response = await dio.get('/tv/popular', queryParameters: {
      'api_key': API_KEY,
      'page': page.toString(),
      'language': 'pt-BR'
    });
    return (response.data['results'] as List)
        .map((item) => Tvshow.fromJson(item))
        .toList();
  }

  Future<List<Tvshow>> getTopRatedTvshows(int page) async {
    var response = await dio.get('/tv/top_rated', queryParameters: {
      'api_key': API_KEY,
      'page': page.toString(),
      'language': 'pt-BR'
    });
    return (response.data['results'] as List)
        .map((item) => Tvshow.fromJson(item))
        .toList();
  }
}
