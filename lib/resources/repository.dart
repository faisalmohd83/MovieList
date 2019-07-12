import 'package:MovieDirect/models/movie_list.dart';
import 'package:MovieDirect/resources/movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();
  Future<MoviesList> fetchAllMovies() => moviesApiProvider.getMoviesNowPlaying();
}
