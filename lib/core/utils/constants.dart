class AppConstants {
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String apiKey = "61854a9ecbed259f4938884b530d31a9";
  static const String nowPlayingBaseUrl = "$baseUrl/movie/now_playing?$apiKey";
  static const String popularBaseUrl = "$baseUrl/movie/popular?$apiKey";
  static const String topRatedBaseUrl = "$baseUrl/movie/top_rated?$apiKey";
}
