import 'package:bloc/bloc.dart';
import 'package:movies_errors/domain/usecases/search_movies.dart';
import 'package:movies_errors/presentation/bloc/search_movies/search_movies_event.dart';
import 'package:movies_errors/presentation/bloc/search_movies/search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMovies getSearchedMovies;

  SearchMoviesBloc(this.getSearchedMovies) : super(SearchMoviesInitial()) {
    on<FetchSearchedMovies>((event, emit) async {
      // TODO: implement event handler
      emit(SearchMoviesLoading());
      final failureOrMovies = await getSearchedMovies(event.query);
      failureOrMovies.fold(
          (failure) => emit(SearchMoviesError(message: failure.toString())),
          (movies) => SearchMoviesLoaded(movies: movies));
    });
  }
}
