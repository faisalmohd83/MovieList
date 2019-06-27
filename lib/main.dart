import 'dart:convert';

import 'package:MovieDirect/APIService.dart';
import 'package:MovieDirect/data/MoviesList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Http App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget {
  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {

  MoviesList moviesList;

  _getLatestMovies() {
    APIService.getMoviesNowPlaying().then((response) {
      setState(() {
        final jsonData = json.decode(response.body);
        moviesList = new MoviesList.fromJson(jsonData);
        // moviesList(new MoviesList.fromJson(jsonData));

        for (var i = 0; i < moviesList.results.length; i++) {
        print(moviesList.results[i].title);
        }
      });
    });
  }

  @override
  initState() {
    super.initState();
    _getLatestMovies();
  }

  // dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movie List"),
        ),
        body: ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: moviesList != null ? moviesList.results.length : 0,
          itemBuilder: (context, index) {
            // return Card(elevation: 2, child: ListTile(title: Text('Faisal')));
            return Card(child: ListTile(title: Text(moviesList.results[index].title)));
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ));
  }
}
