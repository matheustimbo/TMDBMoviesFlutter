import 'package:dio/dio.dart';
import 'package:tmdbmovies/shared/constants.dart';
import 'package:tmdbmovies/shared/models/cast_model.dart';
import 'package:tmdbmovies/shared/models/crew_model.dart';
import 'package:tmdbmovies/shared/models/genre_model.dart';
import 'package:tmdbmovies/shared/models/tvshow_details_model.dart';
import 'package:tmdbmovies/shared/models/tvshow_model.dart';
import 'package:tmdbmovies/shared/models/video_model.dart';

var dioOptions = BaseOptions(
  baseUrl: BASE_URL,
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

class TvshowRepository {
  Dio dio = new Dio(dioOptions);

  Future<List<Crew>> getTvshowCrew(int id) async {
    var response = await dio.get('/tv/$id/credits',
        queryParameters: {'api_key': API_KEY, 'language': 'pt-BR'});

    return (response.data['crew'] as List)
        .map((item) => Crew.fromJson(item))
        .toList();
  }

  Future<List<Cast>> getTvshowCast(int id) async {
    var response = await dio.get('/tv/$id/credits',
        queryParameters: {'api_key': API_KEY, 'language': 'pt-BR'});

    return (response.data['cast'] as List)
        .map((item) => Cast.fromJson(item))
        .toList();
  }

  Future<List<Video>> getTvshowYoutubeVideos(int id) async {
    var response = await dio.get('/tv/$id/videos',
        queryParameters: {'api_key': API_KEY, 'language': 'pt-BR'});

    return (response.data['results'] as List)
        .map((item) => Video.fromJson(item))
        .where((Video video) => video.site == 'YouTube')
        .toList();
  }

  Future<List<Tvshow>> getSimilarTvshows(int id, int page) async {
    var response = await dio.get('/tv/$id/similar', queryParameters: {
      'api_key': API_KEY,
      'language': 'pt-BR',
      'page': page.toString()
    });
    
    

    return (response.data['results'] as List)
        .map((item) => Tvshow.fromJson(item))
        .toList();
  }

  Future<List<Genre>> getTvshowGenres() async {
    var response = await dio.get('/genre/tv/list',
        queryParameters: {'api_key': API_KEY, 'language': 'pt-BR'});

    return (response.data['genres'] as List)
        .map((item) => Genre.fromJson(item))
        .toList();
  }

  Future<TvshowDetails> getTvshowDetailsById(int id) async {
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
