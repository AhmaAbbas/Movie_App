import 'package:dartz/dartz.dart';
import 'package:movies/Moviemoduels/data/Models/movie_detailsmodel.dart';
import 'package:movies/Moviemoduels/domain/movie_entity/Recommendation_entity.dart';
import 'package:movies/Moviemoduels/domain/movie_usecase/recommendation_usecase.dart';
import '../../../core/utls/failure.dart';

import '../movie_entity/movie.dart';
import '../movie_entity/movie_details_entity.dart';
import '../movie_usecase/movidetail_usecase.dart';


abstract class BaseMovieRepository{
  Future<Either<Faulire,List<Movie>>>  getNowPlaying();
  Future<Either<Faulire,List<Movie>>>  getPopularMovies();
  Future<Either<Faulire,List<Movie>>>  getTopRatedmovies();
  Future<Either<Faulire,MovieDetails>> getmoviedetails(MovieDetailsPrameters prameter);
  Future<Either<Faulire,List<Recommendation_Entity>>>  getrecommendations(Recommedaionprameter prameter);
}