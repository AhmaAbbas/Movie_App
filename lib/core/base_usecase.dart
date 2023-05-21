import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/utls/failure.dart';

abstract class BaseUSeCase<T, Prameter>{
  Future<Either<Faulire,T>> call(Prameter prameter);
}

 class Noprameter extends Equatable{
   const Noprameter();
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}