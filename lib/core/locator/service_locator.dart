import 'package:get_it/get_it.dart';
import 'package:movies/Moviemoduels/data/movieRepository.dart';
import 'package:movies/Moviemoduels/data/remotedatasource/movies_remotedatasource.dart';
import 'package:movies/Moviemoduels/domain/baserepository/base_movieRepository.dart';
import 'package:movies/Moviemoduels/domain/movie_usecase/get_popularusecase.dart';
import 'package:movies/Moviemoduels/domain/movie_usecase/get_topratedmovies_usecase.dart';
import 'package:movies/Moviemoduels/domain/movie_usecase/getnowplaying_usecase.dart';
import 'package:movies/Moviemoduels/domain/movie_usecase/movidetail_usecase.dart';
import 'package:movies/Moviemoduels/domain/movie_usecase/recommendation_usecase.dart';

final getit=GetIt.instance;
class ServiceLocator{
  void init(){
    getit.registerLazySingleton<BaseMovieRemoteDataSource>(() =>MovieRemoteDataSource());

    getit.registerLazySingleton<BaseMovieRepository>(() =>
        MovieRepository(baseMovieRemoteDataSource: getit<BaseMovieRemoteDataSource>()));

    getit.registerLazySingleton<GetNowPlaying>(() =>
        GetNowPlaying(baseMovieRepository: getit<BaseMovieRepository>()));

    getit.registerLazySingleton<GetPopularMovies>(()=>
        GetPopularMovies(baseMovieRepository: getit<BaseMovieRepository>()));

    getit.registerLazySingleton<GetTopRatedMovies>(()=>
        GetTopRatedMovies(baseMovieRepository: getit<BaseMovieRepository>()));

    getit.registerLazySingleton<GetMovieDetails_USeCase>(()=>
        GetMovieDetails_USeCase(baseMovieRepository: getit<BaseMovieRepository>()));

    getit.registerLazySingleton<GetRecommedationMovieUsecase>(()=>
        GetRecommedationMovieUsecase(baseMovieRepository: getit<BaseMovieRepository>()));
  }
}