import 'package:flutter/material.dart';
import 'package:movies_errors/domain/entities/movie.dart';


class MoviesList extends StatelessWidget {

  final List<Movie> movies;

  const MoviesList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index){
        final movie = movies[index];
        return ListTile(
          title: Text(movie.title),
          subtitle: Text(movie.overview),
        );
      });
  }
}