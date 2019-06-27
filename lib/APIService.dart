import 'dart:async';
import 'package:http/http.dart' as http;

// Base Url to fetch the data from The Movie Database (TMDb) API.
const baseUrl = "https://api.themoviedb.org/3/movie/now_playing?api_key=";

// The API key for The Movie Database (TMDb).
const apiKey = "8d2244e4902a0d867813df309e90a710";

class APIService {
  static Future getMoviesNowPlaying() {
    var url = baseUrl + apiKey;
    return http.get(url);
  }
}
