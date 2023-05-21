import 'package:equatable/equatable.dart';

class Recommendation_Entity extends Equatable{
  final String? backdropPath;
  final int id;

  const Recommendation_Entity({this.backdropPath, required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [backdropPath,id];

}