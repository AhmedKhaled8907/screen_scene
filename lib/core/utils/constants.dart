class AppConstants {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "61854a9ecbed259f4938884b530d31a9";
  static const String nowPlayingBaseUrl =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularBaseUrl = "$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedBaseUrl =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  static String movieDetailsBaseUrl(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";

  static String similarMoviesBaseUrl(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => "$baseImageUrl$path";
}
