import 'package:movies/Moviemoduels/domain/movie_entity/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({required super.backdropPath,
    required super.overview,
    required super.relasedate,
    required super.title,
    required super.voteAverage,
    required super.id,
    required super.runtime,
    required super.generes});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json){
    return MovieDetailsModel(
        backdropPath:json["backdrop_path"]??"/7bWxAsNPv9CXHOhZbJVlj2KxgfP.jpg",
        overview: json["overview"],
        relasedate: json["release_date"],
        title: json["title"],
        voteAverage: json["vote_average"],
        id: json["id"],
        runtime: json["runtime"],
        generes: List<Generes>.from(json['genres'].map((e) => GeneresModel.fromJson(e))),
    );
  }
}
class GeneresModel extends Generes{
  const GeneresModel({required super.name, required super.id});
  factory GeneresModel.fromJson(Map<String,dynamic> json){
    return GeneresModel(name: json['name'], id: json['id']);
  }
}
