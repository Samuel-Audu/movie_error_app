abstract class SearchMoviesEvent{}

class FetchSearchedMovies extends SearchMoviesEvent{
  final String query;

  FetchSearchedMovies({required this.query});
  
}