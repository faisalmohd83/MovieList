import 'package:MovieDirect/ui/movie_list.dart';
import 'package:flutter/material.dart';

class MyMovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Http App",
      theme: ThemeData.fallback(),
      home: MovieListUI(),
    );
  }
}
