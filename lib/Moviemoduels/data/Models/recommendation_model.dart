import 'package:movies/Moviemoduels/domain/movie_entity/Recommendation_entity.dart';

class RecommendationModel extends Recommendation_Entity{
  const RecommendationModel({required super.backdropPath, required super.id});
  factory RecommendationModel.fromJson(Map<String,dynamic> json){
    return RecommendationModel(id:json['id'] ,backdropPath:json['backdrop_path']??"/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg");
  }

}