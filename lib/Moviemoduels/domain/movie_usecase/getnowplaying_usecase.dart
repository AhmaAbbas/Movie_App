import 'package:dartz/dartz.dart';
import 'package:movies/Moviemoduels/domain/baserepository/base_movieRepository.dart';
import 'package:movies/core/utls/failure.dart';

import '../movie_entity/movie.dart';

class GetNowPlaying{
  final BaseMovieRepository baseMovieRepository;
  GetNowPlaying({required this.baseMovieRepository});
  Future<Either<Faulire,List<Movie>>> call()async{
    return await baseMovieRepository.getNowPlaying();
  }
}