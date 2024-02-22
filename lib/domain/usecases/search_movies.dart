import 'package:dartz/dartz.dart';
import 'package:movies_errors/core/errors/server_failure.dart';
import 'package:movies_errors/domain/entities/movie.dart';
import 'package:movies_errors/domain/repositories/movies_repository.dart';


class SearchMovies{
  final MovieRepository repository;

  SearchMovies({required this.repository});

  Future<Either<Failure, List<Movie>>> call(String query) async{
    return await repository.searchMovies(query);
  }
}