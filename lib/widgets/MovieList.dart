import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movies.dart';
import '../widgets/MovieCard.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var movielist = Provider.of<Movies>(context);
    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: movielist.movieList.length,
          itemBuilder: (ctx, i) => MovieCard(
            movielist.movieList.toList()[i].id,
            movielist.movieList.toList()[i].title,
            movielist.movieList.toList()[i].imageUrl,
            movielist.movieList.toList()[i].genres,
            movielist.movieList.toList()[i].vote,
          ),
        )
      ),
    );
  }
}