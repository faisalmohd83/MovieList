import 'package:MovieDirect/models/movie_list.dart';
import 'package:MovieDirect/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<MoviesList>();

  Stream<MoviesList> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    MoviesList movieList = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(movieList);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();
