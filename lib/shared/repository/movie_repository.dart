import 'package:dio/dio.dart';
import 'package:tmdbmovies/shared/constants.dart';
import 'package:tmdbmovies/shared/models/cast_model.dart';
import 'package:tmdbmovies/shared/models/crew_model.dart';
import 'package:tmdbmovies/shared/models/genre_model.dart';
import 'package:tmdbmovies/shared/models/movie_details_model.dart';
import 'package:tmdbmovies/shared/models/movie_model.dart';
import 'package:tmdbmovies/shared/models/video_model.dart';

var dioOptions = BaseOptions(
  baseUrl: BASE_URL,
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

class MovieRepository {
  Dio dio = new Dio(dioOptions);

  Future<List<Crew>> getMovieCrew(int id) async {
    var response = await dio.get('/movie/$id/credits',
        queryParameters: {'api_key': API_KEY, 'language': 'pt-BR'});

    return (response.data['crew'] as List)
        .map((item) => Crew.fromJson(item))
        .toList();
  }

  Future<List<Cast>> getMovieCast(int id) async {
    var response = await dio.get('/movie/$id/credits',
        queryParameters: {'api_key': API_KEY, 'language': 'pt-BR'});

    return (response.data['cast'] as List)
        .map((item) => Cast.fromJson(item))
        .toList();
  }

  Future<List<Video>> getMovieYoutubeVideos(int id) async {
    var response = await dio.get('/movie/$id/videos',
        queryParameters: {'api_key': API_KEY, 'language': 'pt-BR'});

    return (response.data['results'] as List)
        .map((item) => Video.fromJson(item))
        .where((Video video) => video.site == 'YouTube')
        .toList();
  }

  Future<List<Genre>> getMovieGenres() async {
    var response = await dio.get('/genre/movie/list',
        queryParameters: {'api_key': API_KEY, 'language': 'pt-BR'});

    return (response.data['genres'] as List)
        .map((item) => Genre.fromJson(item))
        .toList();
  }

  Future<MovieDetails> getMovieDetailsById(int id) async {
    var response = await dio.get('/movie/$id',
        queryParameters: {'api_key': API_KEY, 'language': 'pt-BR'});
    return MovieDetails.fromJson(response.data);
  }

  Future<List<Movie>> getSimilarMovies(int id, int page) async {
    var response = await dio.get('/movie/$id/similar', queryParameters: {
      'api_key': API_KEY,
      'language': 'pt-BR',
      'page': page.toString()
    });
    return (response.data['results'] as List)
        .map((item) => Movie.fromJson(item))
        .toList();
  }

  Future<List<Movie>> getPopularMovies(int page) async {
    var response = await dio.get('/movie/popular', queryParameters: {
      'api_key': API_KEY,
      'page': page.toString(),
      'language': 'pt-BR'
    });
    return (response.data['results'] as List)
        .map((item) => Movie.fromJson(item))
        .toList();
  }

  Future<List<Movie>> getUpcomingMovies(int page) async {
    var response = await dio.get('/movie/upcoming', queryParameters: {
      'api_key': API_KEY,
      'page': page.toString(),
      'language': 'pt-BR'
    });
    return (response.data['results'] as List)
        .map((item) => Movie.fromJson(item))
        .toList();
  }

  Future<List<Movie>> getTopRatedMovies(int page) async {
    var response = await dio.get('/movie/top_rated', queryParameters: {
      'api_key': API_KEY,
      'page': page.toString(),
      'language': 'pt-BR'
    });
    return (response.data['results'] as List)
        .map((item) => Movie.fromJson(item))
        .toList();
  }

  Future<List<Movie>> getNowPlayingMovies(int page) async {
    var response = await dio.get('/movie/now_playing', queryParameters: {
      'api_key': API_KEY,
      'page': page.toString(),
      'language': 'pt-BR'
    });
    return (response.data['results'] as List)
        .map((item) => Movie.fromJson(item))
        .toList();
  }
}
