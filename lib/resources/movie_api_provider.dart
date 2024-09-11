import 'dart:async';
import 'dart:convert';

import 'package:MovieDirect/models/movie_list.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:http/http.dart' show Client, Response;

// Base Url to fetch the data from The Movie Database (TMDb) API.
const _baseUrl = "https://api.themoviedb.org/3/movie/now_playing?api_key=";

// The API key for The Movie Database (TMDb).
const _apiKey = "8d2244e4902a0d867813df309e90a710";

class MovieApiProvider {
  Client client = Client();

  /// Fetch latest playing movie list from TMDB.
  Future<MoviesList> getMoviesNowPlaying() async {
    final Trace _firebaseTrackerMovieListFetch =
        FirebasePerformance.instance.newTrace("getMoviesNowPlaying");
    _firebaseTrackerMovieListFetch.start();

    // The API key for The Movie Database (TMDb).
    // var _apiKey = await loadAsset();

    var url = _baseUrl + _apiKey;
    print('url: $url');
    Response response = await client.get(Uri.dataFromString(url));

    _firebaseTrackerMovieListFetch.stop();

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return MoviesList.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
