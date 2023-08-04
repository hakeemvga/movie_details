part of 'movie_bloc.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}
class MoviesLoading extends MovieState {}
class MoviesLoaded extends MovieState {}
class MoviesError extends MovieState{}