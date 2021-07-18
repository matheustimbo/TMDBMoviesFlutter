class Utils {
  static String? getFullPosterUrl(String? posterPath) {
    return posterPath != null
        ? 'https://image.tmdb.org/t/p/w500/$posterPath'
        : null;
  }

  static String? getFullBackdropUrl(String? backdropPath) {
    return backdropPath != null
        ? 'https://image.tmdb.org/t/p/w1280/$backdropPath'
        : null;
  }

  static String? getFullProfileUrl(String? profilePath) {
    return profilePath != null
        ? 'https://image.tmdb.org/t/p/w185/$profilePath'
        : null;
  }
}
