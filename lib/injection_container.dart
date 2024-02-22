import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_errors/core/network/dio.dart';
import 'package:movies_errors/core/network/impl.dart';
import 'package:movies_errors/data/data%20sources/remote/movie_remote_data_source.dart';
import 'package:movies_errors/data/data%20sources/remote/remote_data_source_impl.dart';
import 'package:movies_errors/data/repositories/movie_repo_impl.dart';
import 'package:movies_errors/domain/repositories/movies_repository.dart';
import 'package:movies_errors/domain/usecases/get_popular_movies.dart';
import 'package:movies_errors/domain/usecases/get_trending_movies.dart';
import 'package:movies_errors/domain/usecases/search_movies.dart';
import 'package:movies_errors/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movies_errors/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:movies_errors/presentation/bloc/trending_movies/trending_movies_bloc.dart';

final getIt = GetIt.instance;

void init(){
  //Bloc
  getIt.registerFactory(() => PopularMoviesBloc(getIt()));
  getIt.registerFactory(() => TrendingMoviesBloc(getIt()));
  getIt.registerFactory(() => SearchMoviesBloc(getIt()));

  //Usecase
  getIt.registerLazySingleton(() => GetPopularMovies(repository: getIt()));
  getIt.registerLazySingleton(() => GetTrendingMovies(getIt()));
  getIt.registerLazySingleton(() => SearchMovies(repository: getIt()));
  //Repositories
  getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(remoteDataSource: getIt()));
  //data source
    getIt.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(getIt(),networkRequester: getIt()));

  //Network service
  getIt.registerLazySingleton(() => NetworkRequester(dio: getIt()));
  getIt.registerLazySingleton(() => ImplFormatter());
  getIt.registerLazySingleton(() => Dio());
}