import 'package:movies_errors/domain/usecases/get_trending_movies.dart';
import 'package:movies_errors/presentation/bloc/trending_movies/trending_movie_state.dart';
import 'package:movies_errors/presentation/bloc/trending_movies/trending_movies_event.dart';
import 'package:bloc/bloc.dart';

class TrendingMoviesBloc extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  final GetTrendingMovies getTrendingMovies; 

  TrendingMoviesBloc(this.getTrendingMovies) : super(TrendingMoviesInitial()) {
    on<FetchTrendingMovies>((event, emit) async{
      // TODO: implement event handler
      emit(TrendingMoviesLoading());
      final failureOrMovies = await getTrendingMovies();
      failureOrMovies.fold((failure) => emit(TrendingMoviesError(message: failure.toString())), (movies) => TrendingMoviesLoaded(movies: movies));
    });
  }
}