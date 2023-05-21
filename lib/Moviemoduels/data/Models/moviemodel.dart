import 'package:movies/Moviemoduels/domain/movie_entity/movie.dart';

class MovieModel extends Movie {
  MovieModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.genderids,
      required super.overview,
      required super.voteaverage,
      required super.relaseDate});
  factory MovieModel.fromjson(Map<String,dynamic> json){
      return MovieModel(id:json['id'],
          title: json['title'],
          backdropPath: json['backdrop_path'],
          genderids:List<int>.from(json['genre_ids'].map((e) => e)),
          overview: json['overview'],
          voteaverage: json['vote_average'],
          relaseDate: json['release_date']);
  }
}
