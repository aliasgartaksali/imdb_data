import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../providers/movie.dart';
import '../providers/genre.dart';

class Movies with ChangeNotifier {
  List<Movie> _movies = [];
  List<Genre> _genres = [];

  String genreName(int id) {
    Genre singleGenre = _genres.firstWhere((element) => element.id == id);
    return singleGenre.title;
  }

  List<Movie> get movieList {
    return [..._movies];
  }

  Future<void> fetchAndSetGenres() async {
    const url =
        'https://api.themoviedb.org/3/genre/movie/list?api_key=bacfe018d83ecd4dcd5e3cace1b402ef';
    final response = await http.get(url);
    print(response.body);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    final List<Genre> loadedGenres = [];
    for (var singleGnr in extractedData['genres']) {
      Genre gnr = Genre(
        id: singleGnr["id"],
        title: singleGnr['name'],
      );
      loadedGenres.add(gnr);
    }
    _genres = loadedGenres;
  }

  Future<void> fetchAndSetMovies(String query) async {
    final url =
        'https://api.themoviedb.org/3/search/movie?api_key=bacfe018d83ecd4dcd5e3cace1b402ef&language=en-US&query=$query&page=1&include_adult=true';
    final response = await http.get(url);
    print(response.body);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    final List<Movie> loadedMovies = [];
    for (var singleMvi in extractedData['results']) {
      var genreTitle = "";
      for (var singleGnr in singleMvi['genre_ids']) {
        genreTitle = "$genreTitle ${_genres.firstWhere((element) => element.id.toString() == singleGnr.toString()).title} ";
      }
      genreTitle = genreTitle.trim();
      genreTitle = genreTitle.replaceAll("  ", " | ");
      Movie mvi = Movie(
        id: singleMvi["id"],
        title: singleMvi['original_title'],
        imageUrl: singleMvi['poster_path'],
        genres: genreTitle,
        vote: singleMvi['vote_average'].toString(),
      );
      loadedMovies.add(mvi);
    }
    _movies = loadedMovies;
  }
}
