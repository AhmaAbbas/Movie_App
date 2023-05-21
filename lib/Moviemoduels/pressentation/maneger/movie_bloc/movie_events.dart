import 'package:equatable/equatable.dart';

abstract class MovieEvents extends Equatable{
  const MovieEvents();
  @override
  List<Object> get props =>[];
}
class GetNowPlayingMovieEvent extends MovieEvents{}

class GetPopularMovieEvent extends MovieEvents{}

class GetTopRatedMovieEvent extends MovieEvents{}

