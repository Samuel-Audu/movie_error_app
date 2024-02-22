import 'package:bloc/bloc.dart';
import 'package:movies_errors/domain/usecases/get_popular_movies.dart';
import 'package:movies_errors/presentation/bloc/popular_movies/popular_movies_event.dart';
import 'package:movies_errors/presentation/bloc/popular_movies/popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;

  PopularMoviesBloc(this.getPopularMovies) : super(PopularMoviesInitial()) {
    on<FetchPopularMovies>((event, emit) async {
      // TODO: implement event handler
      emit(PopularMoviesLoading());
      final failureOrMovies = await getPopularMovies();
      failureOrMovies.fold(
          (failure) => emit(PopularMoviesError(message: failure.toString())),
          (movies) => PopularMoviesLoaded(movies: movies));
    });
  }
}
