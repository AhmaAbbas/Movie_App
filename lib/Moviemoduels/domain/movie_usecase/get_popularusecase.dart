import 'package:dartz/dartz.dart';
import 'package:movies/Moviemoduels/domain/baserepository/base_movieRepository.dart';

import '../../../core/utls/failure.dart';
import '../movie_entity/movie.dart';

class GetPopularMovies{
  final BaseMovieRepository baseMovieRepository;
  GetPopularMovies({required this.baseMovieRepository});
  Future<Either<Faulire,List<Movie>>> call()async{
    return await baseMovieRepository.getPopularMovies();
  }
}