import 'package:dartz/dartz.dart';
import 'package:movies/Moviemoduels/domain/baserepository/base_movieRepository.dart';
import 'package:movies/core/base_usecase.dart';

import '../../../core/utls/failure.dart';
import '../movie_entity/movie.dart';

class GetTopRatedMovies extends BaseUSeCase<List<Movie>,Noprameter>{
  final BaseMovieRepository baseMovieRepository;
  GetTopRatedMovies({required this.baseMovieRepository});

  @override
  Future<Either<Faulire, List<Movie>>> call(Noprameter prameter) async{
    return await baseMovieRepository.getTopRatedmovies();
  }


}