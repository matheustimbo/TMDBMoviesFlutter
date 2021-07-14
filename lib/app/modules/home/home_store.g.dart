// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$popularMoviesAtom = Atom(name: 'HomeStoreBase.popularMovies');

  @override
  List<Movie> get popularMovies {
    _$popularMoviesAtom.reportRead();
    return super.popularMovies;
  }

  @override
  set popularMovies(List<Movie> value) {
    _$popularMoviesAtom.reportWrite(value, super.popularMovies, () {
      super.popularMovies = value;
    });
  }

  final _$pageAtom = Atom(name: 'HomeStoreBase.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$loadingPopularMoviesAtom =
      Atom(name: 'HomeStoreBase.loadingPopularMovies');

  @override
  bool get loadingPopularMovies {
    _$loadingPopularMoviesAtom.reportRead();
    return super.loadingPopularMovies;
  }

  @override
  set loadingPopularMovies(bool value) {
    _$loadingPopularMoviesAtom.reportWrite(value, super.loadingPopularMovies,
        () {
      super.loadingPopularMovies = value;
    });
  }

  final _$loadingMorePopularMoviesAtom =
      Atom(name: 'HomeStoreBase.loadingMorePopularMovies');

  @override
  bool get loadingMorePopularMovies {
    _$loadingMorePopularMoviesAtom.reportRead();
    return super.loadingMorePopularMovies;
  }

  @override
  set loadingMorePopularMovies(bool value) {
    _$loadingMorePopularMoviesAtom
        .reportWrite(value, super.loadingMorePopularMovies, () {
      super.loadingMorePopularMovies = value;
    });
  }

  final _$firstFetchAsyncAction = AsyncAction('HomeStoreBase.firstFetch');

  @override
  Future<void> firstFetch() {
    return _$firstFetchAsyncAction.run(() => super.firstFetch());
  }

  final _$fetchPopularMoviesAsyncAction =
      AsyncAction('HomeStoreBase.fetchPopularMovies');

  @override
  Future<void> fetchPopularMovies() {
    return _$fetchPopularMoviesAsyncAction
        .run(() => super.fetchPopularMovies());
  }

  @override
  String toString() {
    return '''
popularMovies: ${popularMovies},
page: ${page},
loadingPopularMovies: ${loadingPopularMovies},
loadingMorePopularMovies: ${loadingMorePopularMovies}
    ''';
  }
}
