import 'package:dio/dio.dart';
import 'package:movies/Moviemoduels/data/remotedatasource/movies_remotedatasource.dart';
import 'package:movies/Moviemoduels/domain/baserepository/base_movieRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/Moviemoduels/domain/movie_entity/Recommendation_entity.dart';
import 'package:movies/Moviemoduels/domain/movie_entity/movie.dart';
import 'package:movies/Moviemoduels/domain/movie_entity/movie_details_entity.dart';
import 'package:movies/Moviemoduels/domain/movie_usecase/movidetail_usecase.dart';
import 'package:movies/Moviemoduels/domain/movie_usecase/recommendation_usecase.dart';
import 'package:movies/core/utls/failure.dart';

import 'Models/movie_detailsmodel.dart';
class MovieRepository extends BaseMovieRepository{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MovieRepository({required this.baseMovieRemoteDataSource});

  @override
  Future<Either<Faulire, List<Movie>>> getNowPlaying() async{
    try{
      final result =await baseMovieRemoteDataSource.getnowplayingmovie();
      return Right(result);
    }on Exception catch(e){
      if(e is DioError)
      {
        return Left(ServerFaulire.fromDioErro(e));
      }
      return Left(ServerFaulire(e.toString()));
    }
  }

  @override
  Future<Either<Faulire, List<Movie>>> getPopularMovies() async{
    try{
      final result =await baseMovieRemoteDataSource.getpopularmovies();
      return Right(result);
    }on Exception catch(e){
      if(e is DioError)
      {
        return Left(ServerFaulire.fromDioErro(e));
      }
      return Left(ServerFaulire(e.toString()));
    }
  }

  @override
  Future<Either<Faulire, List<Movie>>> getTopRatedmovies()async{
    try{
      final result =await baseMovieRemoteDataSource.gettopratedmovies();
      return Right(result);
    }on Exception catch(e){
      if(e is DioError)
      {
        return Left(ServerFaulire.fromDioErro(e));
      }
      return Left(ServerFaulire(e.toString()));
    }
  }

  @override
  Future<Either<Faulire, MovieDetails>> getmoviedetails(MovieDetailsPrameters prameter) async {
    final result =await baseMovieRemoteDataSource.getmoviedetails(prameter);
    try{
      return Right(result);
    }on Exception catch(e){
      if(e is DioError)
      {
        return Left(ServerFaulire.fromDioErro(e));
      }
      return Left(ServerFaulire(e.toString()));
    }

  }

  @override
  Future<Either<Faulire, List<Recommendation_Entity>>> getrecommendations(Recommedaionprameter prameter) async{
    try{
      final result =await baseMovieRemoteDataSource.getrecommendations(prameter);
      return Right(result);
    }on Exception catch(e){
      if(e is DioError)
      {
        return Left(ServerFaulire.fromDioErro(e));
      }
      return Left(ServerFaulire(e.toString()));
    }
  }



}