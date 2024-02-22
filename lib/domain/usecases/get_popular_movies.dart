import 'package:dartz/dartz.dart';
import 'package:movies_errors/core/errors/server_failure.dart';
import 'package:movies_errors/domain/entities/movie.dart';
import 'package:movies_errors/domain/repositories/movies_repository.dart';

class GetPopularMovies{
  final MovieRepository repository;

  GetPopularMovies({required this.repository});
  Future<Either<Failure, List<Movie>>> call() async{
    return await repository.getPopularMovies();
  }

}