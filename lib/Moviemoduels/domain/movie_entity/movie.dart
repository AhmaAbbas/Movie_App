import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genderids;
  final String overview;
  final num voteaverage;
  final String relaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genderids,
    required this.overview,
    required this.voteaverage,
    required this.relaseDate,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, title, backdropPath, genderids, overview, voteaverage, relaseDate];
}
