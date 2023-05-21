import 'package:dio/dio.dart';
import 'package:movies/Moviemoduels/data/Models/movie_detailsmodel.dart';
import 'package:movies/Moviemoduels/data/Models/moviemodel.dart';
import 'package:movies/Moviemoduels/data/Models/recommendation_model.dart';
import 'package:movies/Moviemoduels/domain/movie_entity/movie_details_entity.dart';
import 'package:movies/Moviemoduels/domain/movie_usecase/movidetail_usecase.dart';
import 'package:movies/Moviemoduels/domain/movie_usecase/recommendation_usecase.dart';
import 'package:movies/core/utls/appconstants.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getnowplayingmovie();
  Future<List<MovieModel>> getpopularmovies();
  Future<List<MovieModel>> gettopratedmovies();
  Future<MovieDetailsModel> getmoviedetails(MovieDetailsPrameters prameter);
  Future<List<RecommendationModel>> getrecommendations(Recommedaionprameter prameter);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  Dio dio=Dio();
  Future<List<MovieModel>> getnowplayingmovie() async {
    final responce = await Dio().get(AppConstants.urlgetnowplayingmovies);
    //print(responce);
    return List<MovieModel>.from(
        (responce.data['results'] as List).map((e) => MovieModel.fromjson(e)));
  }

  @override
  Future<List<MovieModel>> getpopularmovies() async {
    final responce = await Dio().get(AppConstants.urlgetpopularmovies);
    return List<MovieModel>.from(
        (responce.data['results'] as List).map((e) => MovieModel.fromjson(e)));
  }

  @override
  Future<List<MovieModel>> gettopratedmovies() async {
    final responce = await Dio().get(AppConstants.urlgettopratedmovies);
    return List<MovieModel>.from(
        (responce.data['results'] as List).map((e) => MovieModel.fromjson(e)));
  }

  @override
  Future<MovieDetailsModel> getmoviedetails(MovieDetailsPrameters prameter) async {
    final response=await Dio().get(AppConstants.urlmovidetails(prameter.id));
    return MovieDetailsModel.fromJson(response.data);
  }

  @override
  Future<List<RecommendationModel>> getrecommendations(Recommedaionprameter prameter)async {
   final response=await Dio().get(AppConstants.urlrecommendations(prameter.id));
   return  List<RecommendationModel>.from((response.data['results'] as List).map(
           (e) => RecommendationModel.fromJson(e)));
  }
}
