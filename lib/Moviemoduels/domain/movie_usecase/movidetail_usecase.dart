import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movies/core/base_usecase.dart';
import 'package:movies/core/utls/failure.dart';

import '../../data/Models/movie_detailsmodel.dart';
import '../baserepository/base_movieRepository.dart';
import '../movie_entity/movie_details_entity.dart';


class GetMovieDetails_USeCase extends BaseUSeCase<MovieDetails,MovieDetailsPrameters>{
  BaseMovieRepository baseMovieRepository;
  GetMovieDetails_USeCase({required this.baseMovieRepository});

  @override
  Future<Either<Faulire, MovieDetails>> call(MovieDetailsPrameters prameter) async{
    // TODO: implement call
   return await baseMovieRepository.getmoviedetails(prameter);
  }


}
class MovieDetailsPrameters extends Equatable{
  final int id;
  const MovieDetailsPrameters({required this.id});

  @override
  // TODO: implement props
  List<Object> get props =>[id,];
}