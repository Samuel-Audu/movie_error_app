import 'package:movies_errors/data/models/movie_model.dart';

abstract class MovieRemoteDataSource{
  Future<List<MovieModel>> getTrendingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> searchMovies(String query);
}