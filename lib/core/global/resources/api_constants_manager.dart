class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "61854a9ecbed259f4938884b530d31a9";

  // Movies Api Constants
  static const String nowPlayingMoviesBaseUrl =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesBaseUrl =
      "$baseUrl/trending/movie/week?api_key=$apiKey";
  static const String topRatedMoviesBaseUrl =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  static String movieDetailsBaseUrl(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";

  static String similarMoviesBaseUrl(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  // Tvs Api Constants
  static const String onTheAirTvsBaseUrl =
      "$baseUrl/tv/on_the_air?api_key=$apiKey";
  static const String popularTvBaseUrl =
      "$baseUrl/trending/tv/week?api_key=$apiKey";
  static const String topRatedTvBaseUrl =
      "$baseUrl/tv/top_rated?api_key=$apiKey";
  static String tvDetailsBaseUrl(int tvId) =>
      "$baseUrl/tv/$tvId?api_key=$apiKey";
  static String similarTvsBaseUrl(int movieId) =>
      "$baseUrl/tv/$movieId/recommendations?api_key=$apiKey";

  // Search Api Constants
  static String multiSearchBaseUrl(String query) =>
      "$baseUrl/search/movie?api_key=$apiKey&query=$query";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => "$baseImageUrl$path";

  static const String listName = "results";
}

class AppJson {
  static const String id = 'id';
  static const String title = 'title';
  static const String name = 'name';
  static const String posterPath = 'poster_path';
  static const String overview = 'overview';
  static const String genres = 'genres';
  static const String releaseDate = 'release_date';
  static const String voteAverage = 'vote_average';
  static const String firstAirDate = 'first_air_date';
  static const String backdropPath = 'backdrop_path';
  static const String numOfSeasons = 'number_of_seasons';
  static const String numOfEpisodes = 'number_of_episodes';
  static const String runtime = 'runtime';
  static const String statusCode = 'status_code';
  static const String statusMessage = "status_message";
  static const String success = 'success';
}
