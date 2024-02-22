import 'package:movies_errors/domain/entities/movie.dart';

class MovieModel{
  final int? id;
  final String title;
  final String overview;
  final String? posterPath;
  final String? year;

  MovieModel({required this.id, 
  required this.title, 
  required this.overview, 
  required this.posterPath, 
  required this.year});

  //convert JSON into movie model
  factory MovieModel.fromJson(Map<String, dynamic> json){
    return MovieModel(
      id: json['id'], 
      title: json['title'], 
      overview: json['overview'], 
      posterPath: json['posterPath'], 
      year: json['year']);
  }

  //convert movie model to JSON
  Map<String, dynamic> toJson(){
    return {
      'id' : id,
      'title' : title,
      'overview' : overview,
      'posterPath' : posterPath,
      'year' : year,
    };
  }

  //convert movie to Entity
  Movie toEntity(){
    return Movie(id: id, title: title, overview: overview, posterPath: posterPath, year: year);
  }
}