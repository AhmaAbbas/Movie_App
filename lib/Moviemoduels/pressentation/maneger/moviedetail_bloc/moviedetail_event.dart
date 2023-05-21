import 'package:equatable/equatable.dart';

abstract class MovieDetailEvents extends Equatable{
  const MovieDetailEvents();
  @override
  List<Object> get props =>[];
}
class GetMovieDetailsEvent extends MovieDetailEvents{
  final int id;
  const GetMovieDetailsEvent({required this.id});
  List<Object> get props =>[id];
}
class GetRecommendationsEvent extends MovieDetailEvents{
  final int id;
  const GetRecommendationsEvent({required this.id});
  List<Object> get props =>[id];
}