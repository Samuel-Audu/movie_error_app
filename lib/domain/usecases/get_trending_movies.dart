import 'package:dartz/dartz.dart';
import 'package:movies_errors/core/errors/server_failure.dart';
import 'package:movies_errors/domain/entities/movie.dart';
import 'package:movies_errors/domain/repositories/movies_repository.dart';

class GetTrendingMovies{
  final MovieRepository repository;

  GetTrendingMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call() async{
    return await repository.getTrendingMovies();
  }
}