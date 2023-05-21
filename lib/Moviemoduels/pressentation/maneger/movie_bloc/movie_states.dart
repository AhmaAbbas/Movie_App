import 'package:equatable/equatable.dart';
import 'package:movies/core/utls/requeststares.dart';

import '../../../domain/movie_entity/movie.dart';

class MovieStates extends Equatable {
  final List<Movie> nowplayingmovies;
  final RequestStates requestStatesnowplaying;
  final String messegesnowplaying;
  final List<Movie> popularmovies;
  final RequestStates requestStatespopular;
  final String popularmesseges;
  final List<Movie> topratedmovies;
  final RequestStates requestStatestoprated;
  final String topratedmesseges;
  const MovieStates({
    this.nowplayingmovies = const [],
    this.requestStatesnowplaying = RequestStates.isloading,
    this.messegesnowplaying = "",
    this.popularmovies = const [],
    this.requestStatespopular = RequestStates.isloading,
    this.popularmesseges = "",
    this.topratedmovies=const[],
    this.requestStatestoprated=RequestStates.isloading,
    this.topratedmesseges="",
  });

  MovieStates CobyWith({
    List<Movie>? nowplayingmovies,
    RequestStates? requestStates,
    String? messege,
    List<Movie>? popularmovies,
    RequestStates? requestStatespopular,
    String? popularmesseges,
    List<Movie>? topratedmovies,
    RequestStates? requestStatestoprated,
    String? topratedmesseges,
  }) {
    return MovieStates(
      nowplayingmovies: nowplayingmovies ?? this.nowplayingmovies,
      requestStatesnowplaying: requestStates ?? this.requestStatesnowplaying,
      messegesnowplaying:messege?? this.messegesnowplaying ,
      popularmovies: popularmovies ?? this.popularmovies,
      requestStatespopular: requestStatespopular??this.requestStatespopular,
      popularmesseges: popularmesseges??this.popularmesseges,
      topratedmovies: topratedmovies??this.topratedmovies,
      requestStatestoprated: requestStatestoprated??this.requestStatestoprated,
      topratedmesseges: topratedmesseges??this.topratedmesseges,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        nowplayingmovies,
        requestStatesnowplaying,
        messegesnowplaying,
        popularmovies,
        requestStatespopular,
        popularmesseges,
        topratedmovies,
        topratedmesseges,
        requestStatestoprated,
      ];
}
