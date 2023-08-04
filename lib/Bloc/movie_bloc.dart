import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_details/Repository/API/movie_api.dart';
import 'package:movie_details/Repository/ModelClass/MovieModel.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  late MovieModel movieModel;
  MovieApi movieapi=MovieApi();
  MovieBloc() : super(MovieInitial()) {
    on<FetchMovies>((event, emit)async {
emit(MoviesLoading());
try{
  movieModel= await movieapi.fetchMovieDetails();
  emit(MoviesLoaded());
}catch(e){
  print(e);
  emit(MoviesError());
}
    });
  }
}
