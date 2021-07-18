import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final int id;
  final String title;
  final String imageUrl;
  final String genres;
  final String vote;

  MovieCard(
    this.id,
    this.title,
    this.imageUrl,
    this.genres,
    this.vote,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(bottom: 10),
      child: Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              child: (imageUrl == null) ? Image.network('https://www.w3schools.com/howto/img_avatar.png') : Image.network('https://image.tmdb.org/t/p/original$imageUrl'),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                  Text(
                    genres,
                    style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 15.0,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                  Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: (double.parse(vote) > 3) ? ((double.parse(vote) > 7) ? Colors.green : Colors.blue) : Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(
                      minHeight: 25,
                      minWidth: 80,
                    ),
                    child: Text(
                      '$vote IMDB',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}