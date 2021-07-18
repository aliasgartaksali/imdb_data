import 'package:flutter/foundation.dart';

class Movie {
  final int id;
  final String title;
  final String imageUrl;
  final String genres;
  final String vote;

  Movie({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.genres,
    @required this.vote,
  });
}