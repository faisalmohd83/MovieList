import 'package:MovieDirect/blocs/movies_bloc.dart';
import 'package:MovieDirect/models/movie_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieListUI extends StatefulWidget {
  @override
  State<MovieListUI> createState() => MovieListUIState();
}

class MovieListUIState extends State<MovieListUI> {
  @override
  initState() {
    super.initState();
    bloc.fetchAllMovies();
  }

  dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    // -----
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie List"),
      ),
      body: StreamBuilder(
          stream: bloc.allMovies,
          builder: (context, snapshot) {
            print(snapshot);
            return prepareListView(snapshot);
            /* switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Center(child: Text('Press button to start.'));
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                    return Center(child: Text('Awaiting result...'));
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return prepareListView(snapshot);
                    }
                } 
            return Center(child: CircularProgressIndicator());*/
          }),
    );
  }

  Widget prepareListView(AsyncSnapshot<MoviesList> snapshot) {
    return ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: snapshot.data.results.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}'),
            ),
            title: Text(snapshot.data.results[index].title),
            subtitle: Text(
              snapshot.data.results[index].popularity.toString(),
              maxLines: 1,
              softWrap: true,
            ),
            onTap: () {
              print(snapshot.data.results[index].originalTitle);
            },
          );
        },
        separatorBuilder: (context, index) {
          return new Divider(indent: 1.0, endIndent: 1.0, color: Colors.cyan);
        });
  }
}
