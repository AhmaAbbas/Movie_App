import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/Moviemoduels/domain/movie_entity/Recommendation_entity.dart';
import 'package:movies/core/base_usecase.dart';
import 'package:movies/core/utls/failure.dart';

import '../baserepository/base_movieRepository.dart';

class GetRecommedationMovieUsecase extends BaseUSeCase<List<Recommendation_Entity>,Recommedaionprameter>{
  BaseMovieRepository baseMovieRepository;
  GetRecommedationMovieUsecase({required this.baseMovieRepository});
  @override
  Future<Either<Faulire, List<Recommendation_Entity>>> call(Recommedaionprameter prameter)async {
    return await baseMovieRepository.getrecommendations(prameter);
  }

}
class Recommedaionprameter extends Equatable{
  final int id;
  const Recommedaionprameter({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}