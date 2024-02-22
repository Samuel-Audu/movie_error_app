import 'package:movies_errors/core/errors/server_exception.dart';
import 'package:movies_errors/core/errors/server_failure.dart';
import 'package:movies_errors/data/data%20sources/remote/movie_remote_data_source.dart';
import 'package:movies_errors/data/models/movie_model.dart';
import 'package:movies_errors/domain/entities/movie.dart';
import 'package:movies_errors/domain/repositories/movies_repository.dart';
import 'package:dartz/dartz.dart';


class MovieRepositoryImpl implements MovieRepository{

  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async{
    try {
      final List<MovieModel> movieModels = await remoteDataSource.getPopularMovies();
      final List<Movie> movies = movieModels.map((model) => model.toEntity()).toList();

      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTrendingMovies() async{
    try {
      final List<MovieModel> movieModels = await remoteDataSource.getTrendingMovies();
      final List<Movie> movies = movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String query) async{
    try {
      final List<MovieModel> movieModels = await remoteDataSource.searchMovies(query);
      final List<Movie> movies = movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  
}