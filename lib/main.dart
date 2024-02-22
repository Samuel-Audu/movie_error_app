import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_errors/injection_container.dart';
import 'package:movies_errors/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movies_errors/presentation/bloc/popular_movies/popular_movies_event.dart';
import 'package:movies_errors/presentation/screens/popular_movies_screen.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: ((context) => getIt<PopularMoviesBloc>()..add(FetchPopularMovies())),
        child: PopularMoviesScreen(),
    ));
  }
}
