import 'package:equatable/equatable.dart';
import 'package:movies/Moviemoduels/data/Models/movie_detailsmodel.dart';
import 'package:movies/Moviemoduels/domain/movie_entity/movie_details_entity.dart';
import 'package:movies/core/utls/requeststares.dart';

import '../../../data/Models/recommendation_model.dart';
import '../../../domain/movie_entity/Recommendation_entity.dart';

class MovieDetailsState  extends Equatable{
  final MovieDetails? movieDetailsModel;
  final RequestStates moviedetailstate;
  final String messegemoviedetails;
  final List<Recommendation_Entity> recommendations;
  final RequestStates recommendationsstate;
  final String recommendationsmessege;

  const MovieDetailsState({ this.movieDetailsModel,
    this.moviedetailstate=RequestStates.isloading,
     this.messegemoviedetails ="",
   this.recommendations = const [],
   this.recommendationsstate=RequestStates.isloading,
   this.recommendationsmessege="",
 });

  MovieDetailsState copywith(
      {MovieDetails? movieDetailsModel,
      RequestStates? moviedetailstate,
      String? messegemoviedetails,
        List<Recommendation_Entity>? recommendations,
        RequestStates? recommendationsstate,
        String? recommendationsmessege,
      }) {

    return MovieDetailsState(
        movieDetailsModel: movieDetailsModel ?? this.movieDetailsModel,
      moviedetailstate: moviedetailstate??this.moviedetailstate,
        messegemoviedetails: messegemoviedetails??this.messegemoviedetails,
      recommendations: recommendations??this.recommendations,
      recommendationsstate: recommendationsstate??this.recommendationsstate,
      recommendationsmessege: recommendationsmessege??this.recommendationsmessege,
    );
  }

  List<Object?> get props =>
      [
        movieDetailsModel,
        moviedetailstate,
        messegemoviedetails,
        recommendations,
        recommendationsstate,
        recommendationsmessege,
      ];
}
