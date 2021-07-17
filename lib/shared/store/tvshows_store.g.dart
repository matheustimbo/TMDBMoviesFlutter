// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tvshows_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TvshowStore on _TvshowStoreBase, Store {
  final _$popularTvshowsAtom = Atom(name: '_TvshowStoreBase.popularTvshows');

  @override
  List<Tvshow> get popularTvshows {
    _$popularTvshowsAtom.reportRead();
    return super.popularTvshows;
  }

  @override
  set popularTvshows(List<Tvshow> value) {
    _$popularTvshowsAtom.reportWrite(value, super.popularTvshows, () {
      super.popularTvshows = value;
    });
  }

  final _$popularTvshowsPageAtom =
      Atom(name: '_TvshowStoreBase.popularTvshowsPage');

  @override
  int get popularTvshowsPage {
    _$popularTvshowsPageAtom.reportRead();
    return super.popularTvshowsPage;
  }

  @override
  set popularTvshowsPage(int value) {
    _$popularTvshowsPageAtom.reportWrite(value, super.popularTvshowsPage, () {
      super.popularTvshowsPage = value;
    });
  }

  final _$loadingPopularTvshowsAtom =
      Atom(name: '_TvshowStoreBase.loadingPopularTvshows');

  @override
  bool get loadingPopularTvshows {
    _$loadingPopularTvshowsAtom.reportRead();
    return super.loadingPopularTvshows;
  }

  @override
  set loadingPopularTvshows(bool value) {
    _$loadingPopularTvshowsAtom.reportWrite(value, super.loadingPopularTvshows,
        () {
      super.loadingPopularTvshows = value;
    });
  }

  final _$loadingMorePopularTvshowsAtom =
      Atom(name: '_TvshowStoreBase.loadingMorePopularTvshows');

  @override
  bool get loadingMorePopularTvshows {
    _$loadingMorePopularTvshowsAtom.reportRead();
    return super.loadingMorePopularTvshows;
  }

  @override
  set loadingMorePopularTvshows(bool value) {
    _$loadingMorePopularTvshowsAtom
        .reportWrite(value, super.loadingMorePopularTvshows, () {
      super.loadingMorePopularTvshows = value;
    });
  }

  final _$topRatedTvshowsAtom = Atom(name: '_TvshowStoreBase.topRatedTvshows');

  @override
  List<Tvshow> get topRatedTvshows {
    _$topRatedTvshowsAtom.reportRead();
    return super.topRatedTvshows;
  }

  @override
  set topRatedTvshows(List<Tvshow> value) {
    _$topRatedTvshowsAtom.reportWrite(value, super.topRatedTvshows, () {
      super.topRatedTvshows = value;
    });
  }

  final _$topRatedTvshowsPageAtom =
      Atom(name: '_TvshowStoreBase.topRatedTvshowsPage');

  @override
  int get topRatedTvshowsPage {
    _$topRatedTvshowsPageAtom.reportRead();
    return super.topRatedTvshowsPage;
  }

  @override
  set topRatedTvshowsPage(int value) {
    _$topRatedTvshowsPageAtom.reportWrite(value, super.topRatedTvshowsPage, () {
      super.topRatedTvshowsPage = value;
    });
  }

  final _$loadingTopRatedTvshowsAtom =
      Atom(name: '_TvshowStoreBase.loadingTopRatedTvshows');

  @override
  bool get loadingTopRatedTvshows {
    _$loadingTopRatedTvshowsAtom.reportRead();
    return super.loadingTopRatedTvshows;
  }

  @override
  set loadingTopRatedTvshows(bool value) {
    _$loadingTopRatedTvshowsAtom
        .reportWrite(value, super.loadingTopRatedTvshows, () {
      super.loadingTopRatedTvshows = value;
    });
  }

  final _$loadingMoreTopRatedTvshowsAtom =
      Atom(name: '_TvshowStoreBase.loadingMoreTopRatedTvshows');

  @override
  bool get loadingMoreTopRatedTvshows {
    _$loadingMoreTopRatedTvshowsAtom.reportRead();
    return super.loadingMoreTopRatedTvshows;
  }

  @override
  set loadingMoreTopRatedTvshows(bool value) {
    _$loadingMoreTopRatedTvshowsAtom
        .reportWrite(value, super.loadingMoreTopRatedTvshows, () {
      super.loadingMoreTopRatedTvshows = value;
    });
  }

  final _$genresAtom = Atom(name: '_TvshowStoreBase.genres');

  @override
  List<Genre> get genres {
    _$genresAtom.reportRead();
    return super.genres;
  }

  @override
  set genres(List<Genre> value) {
    _$genresAtom.reportWrite(value, super.genres, () {
      super.genres = value;
    });
  }

  final _$loadingGenresAtom = Atom(name: '_TvshowStoreBase.loadingGenres');

  @override
  bool get loadingGenres {
    _$loadingGenresAtom.reportRead();
    return super.loadingGenres;
  }

  @override
  set loadingGenres(bool value) {
    _$loadingGenresAtom.reportWrite(value, super.loadingGenres, () {
      super.loadingGenres = value;
    });
  }

  @override
  String toString() {
    return '''
popularTvshows: ${popularTvshows},
popularTvshowsPage: ${popularTvshowsPage},
loadingPopularTvshows: ${loadingPopularTvshows},
loadingMorePopularTvshows: ${loadingMorePopularTvshows},
topRatedTvshows: ${topRatedTvshows},
topRatedTvshowsPage: ${topRatedTvshowsPage},
loadingTopRatedTvshows: ${loadingTopRatedTvshows},
loadingMoreTopRatedTvshows: ${loadingMoreTopRatedTvshows},
genres: ${genres},
loadingGenres: ${loadingGenres}
    ''';
  }
}
