import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Moviemoduels/domain/movie_usecase/get_popularusecase.dart';
import 'package:movies/Moviemoduels/domain/movie_usecase/get_topratedmovies_usecase.dart';
import 'package:movies/Moviemoduels/domain/movie_usecase/getnowplaying_usecase.dart';
import 'package:movies/Moviemoduels/pressentation/maneger/movie_bloc/movie_events.dart';
import 'package:movies/core/utls/requeststares.dart';
import '../../../../core/base_usecase.dart';
import 'movie_states.dart';

class MovieBloc extends Bloc<MovieEvents, MovieStates> {
  final GetNowPlaying getNowPlaying;
  final GetPopularMovies popularMovies;
  final GetTopRatedMovies topRatedMovies;

  MovieBloc(
      {required this.getNowPlaying,
      required this.popularMovies,
      required this.topRatedMovies})
      : super(const MovieStates()) {
    on<GetNowPlayingMovieEvent>((event, emit) async {
      await getnowplayingmovies(emit);
    });

    on<GetPopularMovieEvent>((event, emit) async {
      await getpopularmovies(emit);
    });

    on<GetTopRatedMovieEvent>((event, emit) async {
      await gettopratedmovies(emit);
    });
  }

  Future<void> getnowplayingmovies(Emitter<MovieStates> emit) async {
    final result = await getNowPlaying.call();
    result.fold((l) {
      emit(state.CobyWith(
          messege: l.error, requestStates: RequestStates.iserror));
    }, (r) {
      emit(state.CobyWith(
          nowplayingmovies: r, requestStates: RequestStates.isloaded));
    });
  }

  Future<void> getpopularmovies(Emitter<MovieStates> emit) async {
    final result = await popularMovies.call();
    result.fold((l) {
      emit(state.CobyWith(
          popularmesseges: l.error,
          requestStatespopular: RequestStates.iserror));
    }, (r) {
      emit(state.CobyWith(
          popularmovies: r, requestStatespopular: RequestStates.isloaded));
    });
  }

  Future<void> gettopratedmovies(Emitter<MovieStates> emit) async {
    final result = await topRatedMovies(Noprameter());
    result.fold((l) {
      emit(state.CobyWith(
          topratedmesseges: l.error,
          requestStatestoprated: RequestStates.iserror));
    }, (r) {
      emit(state.CobyWith(
          topratedmovies: r, requestStatestoprated: RequestStates.isloaded));
    });
  }
}
