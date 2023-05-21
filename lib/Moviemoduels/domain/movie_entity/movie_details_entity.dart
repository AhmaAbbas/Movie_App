import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final String overview;
  final String relasedate;
  final String title;
  final num voteAverage;
  final num id;
  final num runtime;
  final List<Generes> generes;

  const MovieDetails(
      {required this.backdropPath,
      required this.overview,
      required this.relasedate,
      required this.title,
      required this.voteAverage,
      required this.id,
      required this.runtime, required this.generes,
      });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        backdropPath,
        overview,
        relasedate,
        title,
        voteAverage,
        id,
        runtime
      ];
}
class Generes extends Equatable{
  final String name;
  final int id;

  const Generes({
    required this.name, required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [name,id];
}
