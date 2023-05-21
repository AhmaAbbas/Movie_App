import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Moviemoduels/domain/movie_usecase/movidetail_usecase.dart';
import 'package:movies/Moviemoduels/pressentation/maneger/moviedetail_bloc/moviedetail_event.dart';
import 'package:movies/Moviemoduels/pressentation/maneger/moviedetail_bloc/moviedetail_state.dart';
import 'package:movies/core/utls/requeststares.dart';

import '../../../domain/movie_usecase/recommendation_usecase.dart';

class MovieDetailsBloc extends Bloc<MovieDetailEvents,MovieDetailsState>{
  GetMovieDetails_USeCase getMovieDetails_USeCase;
  GetRecommedationMovieUsecase getRecommedationMovieUsecase;
  MovieDetailsBloc({required this.getMovieDetails_USeCase,required this.getRecommedationMovieUsecase})
      :super(MovieDetailsState()){
    print(state);
    on<GetMovieDetailsEvent>((event, emit)async {
      final result=await getMovieDetails_USeCase(MovieDetailsPrameters(id: event.id));
      result.fold((l) {
        print(state);
        emit(state.copywith( moviedetailstate: RequestStates.iserror,messegemoviedetails: l.error));
      }, (r) {
        print(r);
        print(state);
        emit(state.copywith(movieDetailsModel: r,moviedetailstate: RequestStates.isloaded));
      });
    });
    on<GetRecommendationsEvent>(get_recommendations);
  }



  FutureOr<void> get_recommendations(event, emit)async{
    final result=await getRecommedationMovieUsecase(Recommedaionprameter(id: event.id));
    result.fold((l) {
      emit(state.copywith( recommendationsstate: RequestStates.iserror,recommendationsmessege: l.error));
    }, (r) {
      //print(r);
      emit(state.copywith(recommendations:r,recommendationsstate: RequestStates.isloaded));
    });
  }
}