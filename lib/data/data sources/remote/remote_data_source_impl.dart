import 'dart:convert';

import 'package:movies_errors/core/network/dio.dart';
import 'package:movies_errors/core/network/impl.dart';
import 'package:movies_errors/data/data%20sources/remote/movie_remote_data_source.dart';
import 'package:movies_errors/data/models/movie_model.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final NetworkRequester networkRequester;
  final ImplFormatter fmt;

  MovieRemoteDataSourceImpl(this.fmt, {required this.networkRequester});

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    // TODO: implement getPopularMovies
    return await fmt.format(() async {
      try {
        final responseBody = await networkRequester.get('/movie/popular');

        //verify that results is actually a list
        if (responseBody['results'] is! List) {
          throw Exception('result is NOT a LIST');
        }
        final List<MovieModel> popularMovies = (responseBody['results'] as List)
            .map((movie) => MovieModel.fromJson(movie))
            .toList();
        print(popularMovies);
        return popularMovies;
      } catch (error) {
        print(error);
        rethrow;
      }
    });
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    // TODO: implement getTrendingMovies
    return await fmt.format(() async {
      final response =
          await networkRequester.get('/trending/movie/day?language=en-US');
      final responseBody = jsonDecode(response);
      final List<MovieModel> trendingMovies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return trendingMovies;
    });
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    // TODO: implement searchMovies
    return await fmt.format(() async {
      final response = await networkRequester.get('/search/movie');
      final responseBody = jsonDecode(response);
      final List<MovieModel> queriedMovies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return queriedMovies;
    });
  }
}
